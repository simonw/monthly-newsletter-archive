#!/usr/bin/env bash
# Copy tracked Markdown newsletters from ~/dev/monthly into this archive once
# their original first-add commit is at least 25 days old. Each copied file is
# committed separately with author and committer dates set to that original
# source commit date.
set -euo pipefail

SOURCE_DIR="${SOURCE_DIR:-$HOME/dev/monthly}"
DAYS_OLD="${DAYS_OLD:-25}"

script_dir="$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)"

if ! git -C "$script_dir" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: $script_dir is not a git repository" >&2
  exit 1
fi

if ! git -C "$SOURCE_DIR" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Error: $SOURCE_DIR is not a git repository" >&2
  exit 1
fi

mtime_epoch() {
  if stat -f %m "$1" >/dev/null 2>&1; then
    stat -f %m "$1"
  else
    stat -c %Y "$1"
  fi
}

iso_from_epoch() {
  if date -r "$1" '+%Y-%m-%dT%H:%M:%S%z' >/dev/null 2>&1; then
    date -r "$1" '+%Y-%m-%dT%H:%M:%S%z'
  else
    date -d "@$1" '+%Y-%m-%dT%H:%M:%S%z'
  fi
}

update_index() {
  local tmp_index
  tmp_index="$(mktemp)"

  (
    cd "$script_dir"
    find . -path ./.git -prune -o -type f -name '*.md' -print |
      sed 's#^\./##' |
      awk -F/ 'tolower($NF) != "readme.md"' |
      sort |
      jq -R -s 'split("\n")[:-1]'
  ) >"$tmp_index"

  if [ ! -f "$script_dir/index.json" ] || ! cmp -s "$tmp_index" "$script_dir/index.json"; then
    mv "$tmp_index" "$script_dir/index.json"
    git -C "$script_dir" add -- index.json
    git -C "$script_dir" commit --only -m "Update index.json" -- index.json
    return 0
  fi

  rm -f "$tmp_index"
  return 1
}

now_epoch="$(date +%s)"
cutoff_epoch="$((now_epoch - (DAYS_OLD * 86400)))"
copied=0

while IFS= read -r -d '' relpath; do
  filename="$(basename -- "$relpath")"
  case "$(printf '%s' "$filename" | tr '[:upper:]' '[:lower:]')" in
    readme.md) continue ;;
  esac

  source_path="$SOURCE_DIR/$relpath"
  dest_path="$script_dir/$relpath"

  if [ -e "$dest_path" ]; then
    continue
  fi

  first_added_epoch="$(
    git -C "$SOURCE_DIR" log --follow --diff-filter=A --format=%ct -- "$relpath" | tail -n 1
  )"
  first_added_iso="$(
    git -C "$SOURCE_DIR" log --follow --diff-filter=A --format=%cI -- "$relpath" | tail -n 1
  )"

  if [ -z "$first_added_epoch" ] || [ -z "$first_added_iso" ]; then
    first_added_epoch="$(mtime_epoch "$source_path")"
    first_added_iso="$(iso_from_epoch "$first_added_epoch")"
  fi

  if [ "$first_added_epoch" -gt "$cutoff_epoch" ]; then
    continue
  fi

  mkdir -p "$(dirname -- "$dest_path")"
  cp -p "$source_path" "$dest_path"

  git -C "$script_dir" add -- "$relpath"
  GIT_AUTHOR_DATE="$first_added_iso" GIT_COMMITTER_DATE="$first_added_iso" \
    git -C "$script_dir" commit --only --date="$first_added_iso" \
      -m "Add $relpath" -- "$relpath"

  copied="$((copied + 1))"
done < <(git -C "$SOURCE_DIR" ls-files -z -- '*.md')

if [ "$copied" -eq 0 ]; then
  echo "No eligible markdown files to sync."
else
  echo "Synced and committed $copied markdown file(s)."
fi

if update_index; then
  echo "Updated and committed index.json."
else
  echo "index.json is already up to date."
fi
