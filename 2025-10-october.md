# LLM digest: October 2025

I published [81 posts](https://simonwillison.net/2025/Oct/) on my blog in October. Here's your sponsors-only summary of the most important trends and highlights from the past month.

As always, this issue and previous issues are archived in my [simonw-private/monthly](https://github.com/simonw-private/monthly) GitHub repository.

## Coding agents and "vibe engineering"

This month I've finally moved beyond using [coding agents](https://simonwillison.net/tags/coding-agents/) (Claude Code, Codex CLI etc) for smaller tasks and embraced them for large pieces of work against my main codebases. Datasette 1.0a20 is due any day now and will include a total redesign of the core permissions system where the code was [mostly written by Claude Code](https://github.com/simonw/datasette/compare/1.0a19...2b962bea) (over 100 commits!) under my supervision.

I wrote a bunch of posts about this along the way, as follow-ups to my September 30th post on [Designing agentic loops](https://simonwillison.net/2025/Sep/30/designing-agentic-loops/):

- October 5th: [Embracing the parallel coding agent lifestyle](https://simonwillison.net/2025/Oct/5/parallel-coding-agents/) talks about how I finally overcame my fear of not being able to keep up with what agents running in parallel were doing.
- October 7th: [Vibe engineering](https://simonwillison.net/2025/Oct/7/vibe-engineering/) - we clearly need a term that describes working with LLMs and coding agents for real software engineering, not just vibe-coding small prototypes. I proposed "vibe engineering" with my tongue half-planted in my cheek. There's a lot of stuff in here about professional software engineering skills that transfer well to agents, like comprehensive tests and automated staging environments.
- October 8th: [Claude can write complete Datasette plugins now](https://simonwillison.net/2025/Oct/8/claude-datasette-plugins/) - a coding agent really can spin up a full, working Datasette plugin from a single prompt.
- October 22nd: I gave a talk about [Living dangerously with Claude](https://simonwillison.net/2025/Oct/22/living-dangerously-with-claude/), mainly about the benefits of running these agents in a good sandbox, and later shared notes and slides.
- October 25th: a shorter piece with [my tips on setting up a codebase for coding agents](https://simonwillison.net/2025/Oct/25/coding-agent-tips/).


For a further example of coding agents against large existing projects, Mitchell Hashimoto wrote a great piece about [Vibing a Non-Trivial Ghostty Feature](https://mitchellh.com/writing/non-trivial-vibing) - my [notes here](https://simonwillison.net/2025/Oct/11/vibing-a-non-trivial-ghostty-feature/).

[Just Talk To It---the no-bs Way of Agentic Engineering](https://steipete.me/posts/just-talk-to-it) by Peter Steinberger has some useful tips too ([my notes](https://simonwillison.net/2025/Oct/14/agentic-engineering/).)

And to end the month, Golang cryptographer Filippo Valsorda wrote about how [Claude Code Can Debug Low-level Cryptography](https://words.filippo.io/claude-debugging/), describing three gnarly low-level bugs in a novel cryptographic algorithm that Claude Code was able to diagnose.

## Claude Code for web

Anthropic had a busy month, but their biggest release was undoubtedly **Claude Code for web**. I had a weekend of preview access and wrote about the release in [Claude Code for web—a new asynchronous coding agent from Anthropic](https://simonwillison.net/2025/Oct/20/claude-code-for-web/).

It's their answer to OpenAI's Codex Cloud and Google's Gemini Jules - an interface you can assign tasks to that will then fire up a server-side container, run Claude Code and submit a PR back to your GitHub repository with the results.

I made a YouTube video [Building a tool to copy-paste share terminal sessions using Claude Code for web](https://simonwillison.net/2025/Oct/23/claude-code-for-web-video/) showing how I built my [terminal-to-html](https://tools.simonwillison.net/terminal-to-html) tool for turning terminal sessions (e.g. from Claude Code CLI) into shareable HTML files.

## NVIDIA DGX Spark

NVIDIA furnished me with a preview unit of their new DGX Spark, a neat little desktop workstation with 128GB of GPU-accessible RAM designed for AI R&D. I wrote up my initial impressions in [NVIDIA DGX Spark: great hardware, early days for the ecosystem](https://simonwillison.net/2025/Oct/14/nvidia-dgx-spark/).

When DeepSeek released their OCR model later in the month I was able to try it out on the DGX Spark and wrote about that in [Getting DeepSeek-OCR working on an NVIDIA Spark via brute force using Claude Code](https://simonwillison.net/2025/Oct/20/deepseek-ocr-claude-code/) - it turns out Claude Code is the perfect antidote to the frustration of trying to figure out how to run PyTorch on novel hardware!

This post by EXO labs on [running Llama-3.1 8B faster on a Mac Studio connected to a DGX Spark](https://blog.exolabs.net/nvidia-dgx-spark/) ([my notes](https://simonwillison.net/2025/Oct/16/nvidia-dgx-spark-apple-mac-studio/)) is interesting too.

## Claude Skills

Anthropic's other big release this month (aside from Haiku 4.5) was **Claude Skills**.

I accidentally leaked the existence of this feature a week before the official announcement!

Jesse Vincent published a fascinating post on [Superpowers: How I'm using coding agents in October 2025](https://blog.fsck.com/2025/10/09/superpowers/) where he described a pattern he was using that was inspired by reverse-engineering aspects of how Claude's own document editing skills worked.

I [dug into those too](https://simonwillison.net/2025/Oct/10/claude-skills/) and shared my notes about how exactly Claude's `.docx` and `.pdf` and `.xlsx` and `.pptx` editing features worked, via instructions in a `/mnt/skills/` folder in the Claude container filesystem.

Turns out this was a new feature that hadn't been announced yet! Anthropic made [their announcement on October 16th](https://www.anthropic.com/news/skills) and I wrote up my thoughts in [Claude Skills are awesome, maybe a bigger deal than MCP](https://simonwillison.net/2025/Oct/16/claude-skills/).

The shortest possible version: a skill is a Markdown file (optionally accompanied by executable scripts) that tells Claude how to do a useful thing - like read and write `.docx` files.

Claude Code knows to scan those skills on startup but, rather than reading the whole thing, just reads a description from the YAML frontmatter of what the skill does.

If you ask Claude to make you a `.docx` file it knows to read the rest of the skill before it starts working on the task.

It's effectively a clever token-saving prompt hack. I really like it, and I love that it already works with other models and coding agent harnesses because telling them to "go read skills/docx.md" works without any further custom integration.


## OpenAI DevDay and GitHub Universe

OpenAI hosted their annual DevDay event on October 6th. I did a [live blog of the opening keynote](https://simonwillison.net/2025/Oct/6/openai-devday-live-blog/) and followed up with two posts about smaller releases that weren't covered in the keynote:

- [GPT-5 Pro](https://simonwillison.net/2025/Oct/6/gpt-5-pro/) is now available in the OpenAI API
- [gpt-image-1-mini](https://simonwillison.net/2025/Oct/6/gpt-image-1-mini/) is a new, much cheaper image generation model.

I talked about my impressions of the keynote with Alex Volkov on the ThursdAI livestream, which is [archived on YouTube here](https://www.youtube.com/live/M6paPiur4yQ?t=7554s).

The biggest announcement in the keynote was a new app platform, where developers can create custom UI that can be embedded directly in the ChatGPT consumer apps - think Zillow providing a custom real-estate listings and search view when the user asks about houses for sale.

With hindsight this has been a slow burn - in the three weeks since DevDay I've not seen much activity around the new platform, but this could just be because it takes more than three weeks (even with AI-assistance) to build something polished enough to release.

My other big conference in October was GitHub Universe, also held at Fort Mason in San Francisco (the same venue as DevDay).

GitHub's conference was *almost entirely* about AI-coding assistance too, mainly promoting their Copilot family of tools.

The biggest news was something they call [Agent HQ](https://github.blog/news-insights/company-news/welcome-home-agents/) - they're acknowledging that every coding agent has deep integration with GitHub already and making that official by adding agent management features directly to GitHub itself, along with partnerships such that a single GitHub Copilot subscription can be used to access coding agent products from other vendors.

GitHub Universe has the *best* conference badges! This year's was a Raspberry Pi Pico with a color screen and WiFi - I wrote about my experiments with that in  [Hacking the WiFi-enabled color screen GitHub Universe conference badge](https://simonwillison.net/2025/Oct/28/github-universe-badge/).

## Python 3.14

Python 3.14 was released on October 8th. I [wrote about the release highlights](https://simonwillison.net/2025/Oct/8/python-314/), including the retirement of Python 3.9 which means that library maintainers like myself can finally start depending on features only available in Python 3.10 and later.

Miguel Grinberg ran some [interesting benchmarks](https://blog.miguelgrinberg.com/post/python-3-14-is-here-how-fast-is-it) illustrating the performance improvements over Python 3.13 and digging into the new free-threaded builds.

I figured out a neat pattern for running my project tests against different versions of Python using `uv`, which I wrote up as a TIL: [Testing different Python versions with uv with-editable and uv-test](https://til.simonwillison.net/python/uv-tests).

I'm a board member of the Python Software Foundation and [we announced disappointing news](https://pyfound.blogspot.com/2025/10/NSF-funding-statement.html) concerning a $1.5m NSF grant application which we were forced to withdraw due to anti-DEI terms that were attached to the grant program after we had applied. Here's [my perspective on the situation](https://simonwillison.net/2025/Oct/27/psf-withdrawn-proposal/).

## October in Chinese AI model releases

China continues to produce the best available open weight models, most of which are under clean open source licenses.

From the start of the month:

- DeepSeek-V3.2-Exp - 690GB, MIT license
- GLM-4.6 from Z.ai - 714GB, MIT license

Here are [my notes and pelicans](https://simonwillison.net/2025/Oct/1/two-pelicans/) on those.

I mentioned DeepSeek OCR above - a 6.7GB MIT licensed model ([here on Hugging Face](https://huggingface.co/deepseek-ai/DeepSeek-OCR)) that specializes in OCR tasks.

- MiniMax M2 - 230GB, MIT license, is a particularly notable model due to its size - much smaller than the other leading Chinese models but with very strong performance. It [made me an excellent pelican](https://simonwillison.net/2025/Oct/29/minimax-m2/), possibly the best I've seen from any open weight model.

Last month Qwen released their [Qwen-3 VL](https://github.com/QwenLM/Qwen3-VL) vision LLM as a big 235B parameter model. In October they followed that up with 2B, 4B, 8B, 23B, and 30B parameter versions, all under an Apache 2 license.

On October 29th, within hours of each other, coding IDEs Cursor and Windsurf *both* released their own custom code-specialist LLMs optimized for speed.

I wrote about these [Composer-1 from Cursor](https://simonwillison.net/2025/Oct/29/cursor-composer/) and [SWE-1.5 from Windsurf](https://simonwillison.net/2025/Oct/29/swe-15/).

Windsurf's SWE-1.5 is hosted by Cerebras and is extremely fast.

Frustratingly, both of these are built on top of existing open weight models but neither company would disclose which model they used!

I have a *very* strong suspicion that the base models here are open weight models from China. [This tweet](https://x.com/zai_org/status/1984076614951420273) from Z.ai (makers of GLM) makes me suspect the Windsurf SWE-1.5 model is based on GLM-4.5 or 4.6.

I think it's rude not to credit the base model, even when the license doesn't require such attribution.

## Miscellaneous extras

- Thanks to Drew Breunig [I kind of get DSPy now](https://simonwillison.net/2025/Oct/4/drew-on-dspy/).
- Geoffrey Litt shared a neat new analogy for coding with LLMs: [Code Like a Surgeon](https://www.geoffreylitt.com/2025/10/24/code-like-a-surgeon).
- Andrej Karpathy's [nanochat is fun](https://simonwillison.net/2025/Oct/13/nanochat/) - a tiny but useful LLM you can train for hundreds or low thousands of dollars.
- Anthropic released Haiku 4.5 - [my notes](https://simonwillison.net/2025/Oct/15/claude-haiku-45/). It's as capable as Sonnet 4 was and a lot cheaper, but still more expensive than the cheap-and-fast models from OpenAI and Gemini.
- Andy Masley says [The AI water issue is fake](https://andymasley.substack.com/p/the-ai-water-issue-is-fake).
- My TIL on [Exploring OpenAI's deep research API model o4-mini-deep-research](https://til.simonwillison.net/llms/o4-mini-deep-research) digs a little bit more into the Responses API.
- OpenAI released [ChatGPT Atlas](https://simonwillison.net/2025/Oct/21/introducing-chatgpt-atlas/), their AI-enabled web browser. I remain deeply skeptical of the entire category of AI browsers thanks to the enormous security challenges they bring. I published some more notes on this in [Dane Stuckey (OpenAI CISO) on prompt injection risks for ChatGPT Atlas](https://simonwillison.net/2025/Oct/22/openai-ciso-on-atlas/).
- For fun I decided to try running SLOCCount - a 20+ year old Perl+C codebase for counting lines of code - in WebAssembly (with Claude Code doing all the work). [It worked!](https://simonwillison.net/2025/Oct/22/sloccount-in-webassembly/)
- The way [Claude Code answers questions about itself](https://simonwillison.net/2025/Oct/24/claude-code-docs-map/) via a Markdown map of its own documentation is really neat. More LLM tools should adopt this pattern!

## Tools I'm using at the moment

My October was dominated by Claude. I started the month with a free Claude Max account Anthropic gave me to test out some stuff, and when that expired I ended up paying for the $100/month plan (which may well become the $200/month plan soon given how much value I'm getting.)

I've been mainly working in Claude Code CLI and Claude Code for the web. I've also been throwing occasional tasks at OpenAI's Codex Cloud and Codex CLI - partly to save Claude tokens and partly to get a feel for how the two compare.

My personal coding style turns out to be a better fit for Claude Sonnet 4.5 than for GPT-5-Codex, another reason I've been leaning more heavily on Claude this month.

I'm leaning *hard* into parallel agents. I'll often have one or two local agents running against my main project, sometimes in a worktree but occasionally in the same checkout if they are working on different parts of the code. Usually there's one main one that I'm watching closely and another that is just cleaning up a minor annoyance - figuring out and fixing some warnings in a documentation build script, for example.

I'm also using their cloud counterparts for larger research tasks. "Read the code in file X, describe what it does and propose ways it could be improved", or "investigate the skipped tests in this test suite and produce a report on them".

Quite a few of those research results have ended up in my new [simonw/research](https://github.com/simonw/research) GitHub repository. I need to write a post about that!

I've been experimenting with local models on the DGX Spark machine, accessed via Tailscale, but so far I still haven't found one that's strong enough to replace my cloud-based LLM usage.

## That's it for October!

If this newsletter was useful feel free to forward it to friends who might find it useful too, especially if they might be convinced to sign up to sponsor me for the next one!

Thanks for your support,

Simon Willison - [simonwillison.net](https://simonwillison.net/)

I'm available for consulting calls over Zoom or similar, you can contact me at contact@simonwillison.net
