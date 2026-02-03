# LLM digest: January 2026

I published [59 posts](https://simonwillison.net/2026/Jan/) on my blog in January. Here's your sponsors-only summary of the most important trends and highlights from the past month.

As always, this issue and previous issues are archived in my [simonw-private/monthly](https://github.com/simonw-private/monthly) GitHub repository.

## LLM predictions for 2026

The **Oxide and Friends** podcast has an annual episode where they discuss predictions for the technology industry over the next 1, 3 and 6 years. I participated [in the 2025 edition](https://simonwillison.net/2025/Jan/10/ai-predictions/) and they [invited me back for 2026](https://oxide-and-friends.transistor.fm/episodes/predictions-2026).

We recorded on Monday 5th January and now that January is over [my predictions](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/) are already looking like they were *way* too safe.

These predictions in particular all feature in this month's digest:

- [1 year: It will become undeniable that LLMs write good code](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/#1-year-it-will-become-undeniable-that-llms-write-good-code)
- [1 year: We're finally going to solve sandboxing](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/#1-year-we-re-finally-going-to-solve-sandboxing), so our coding agents can run untrusted code safely and in a controlled way
- [1 year: A "Challenger disaster" for coding agent security](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/#1-year-a-challenger-disaster-for-coding-agent-security), because we have *not* been running them safely at all!
- [1 year: Kākāpō parrots will have an outstanding breeding season](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/#1-year-k-k-p-parrots-will-have-an-outstanding-breeding-season)
- [3 years: the coding agents Jevons paradox for software engineering will resolve, one way or the other](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/#3-years-the-coding-agents-jevons-paradox-for-software-engineering-will-resolve-one-way-or-the-other) - we'll know if reduced cost of building software increased demand enough for our careers to stay healthy
- [3 years: Someone will build a new browser using mainly AI-assisted coding and it won't even be a surprise](https://simonwillison.net/2026/Jan/8/llm-predictions-for-2026/#3-years-someone-will-build-a-new-browser-using-mainly-ai-assisted-coding-and-it-won-t-even-be-a-surprise)

## Coding agents get even more attention

The big theme for December 2025 was that coding agents - most specifically Anthropic's Claude Code and OpenAI's Codex CLI - had gotten *really good* thanks to Claude Opus 4.5 and GPT-5.1/5.2's much improved ability to break down complex coding tasks into long running tool call chains and reliably execute them.

This theme has held strong in January as more people have caught on to how good coding agents have become. As just one illustrative example I enjoyed [this TikTok take](https://www.tiktok.com/@chris_ashworth/video/7600801037292768525) from QLab theater automation software developer Chris Ashworth - I have [some highlights from the transcript here](https://simonwillison.net/2026/Jan/30/a-programming-tool-for-the-arts/).

Claude Code in particular has been breaking out into the mainstream, earning a profile in The Atlantic titled [Move Over, ChatGPT](https://www.theatlantic.com/technology/2026/01/claude-code-ai-hype/685617/).

I've been calling Claude Code a "general agent" disguised as a coding agent for a while now - it can help automate any task which can be achieved by typing commands into a computer, which is a *lot* of tasks. This month Anthropic leaned into that with the launch of **Claude Cowork** - here are [my first impressions](https://simonwillison.net/2026/Jan/12/claude-cowork/) - a macOS desktop version of Claude Code aimed at less technical users. Unlike default Claude Code it runs in a sandboxed environment (a Linux VM), has a less terminal-centric interface and a name that doesn't suggest it's just for coding.

OpenAI's [new Codex macOS desktop app](https://simonwillison.net/2026/Feb/2/introducing-the-codex-app/) covers a lot of the same ground.

OpenAI also [quietly shipped a major upgrade to **ChatGPT Containers**](https://simonwillison.net/2026/Jan/26/chatgpt-containers/) - the name I'm now using for ChatGPT Code Interpreter, the feature where ChatGPT can execute code in a sandbox as part of replying to a conversation. It used to just support Python, but now it can also execute Bash, Ruby, Perl, PHP, Go, Java, Swift, Kotlin, C, and C++ - *and* it can download content from the public internet into the container, and install additional packages via `pip` and `npm`. Bizarrely OpenAI have not documented any of these new features anywhere!

## Clawdbot/Moltbot/OpenClaw went very viral

**[OpenClaw](https://openclaw.ai/)** (after a couple of renames) is the hottest project in the AI space right now. It's an open source implementation of the personal digital assistant pattern, wiring up all sorts of tools and skills to an agent loop that can be controlled via a messaging app such as WhatsApp or Telegram or Slack or Discord.

Last week the OpenClaw community spawned **Moltbook**, effectively a Facebook style social media platform for AI agents running on OpenClaw to talk to each other. I think it's best seen as an art project but it gained *enormous* traction very quickly. I wrote about it on Friday when I said [Moltbook is the most interesting place on the internet right now](https://simonwillison.net/2026/Jan/30/moltbook/) which got me an interview (and photoshoot!) with the New York Times for the story [A Social Network for A.I. Bots Only. No Humans Allowed.](https://www.nytimes.com/2026/02/02/technology/moltbook-ai-social-media.html?unlocked_article_code=1.JFA.kBCd.hUw-s4vvfswK&smid=url-share) which ran on Monday morning.

I'm glad I said it was the most interesting place on the internet "right now" because I think the novelty has already worn off - the site now has hundreds of thousands of accounts and the volume of low quality spam and crypto scams has completely overwhelmed any of the earlier interesting content.

I think the most interesting thing about OpenClaw (and Moltbook) is that it demonstrates the enormous existing demand for an unfettered digital assistant. OpenClaw isn't trivial to setup (here are [my notes on getting started in a Docker container](https://til.simonwillison.net/llms/openclaw-docker)) and is inherently vulnerable to prompt injection and [lethal trifecta attacks](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/) but the value it provides is so high that thousands of people are willing to tolerate the risk.

It's now my top contender for the "Challenger disaster" prediction I made earlier this month.

## Kākāpō breeding season is off to a really strong start

I love [Kākāpō parrots](https://en.wikipedia.org/wiki/K%C4%81k%C4%81p%C5%8D) - New Zealand's flightless nocturnal parrots that are critically endangered - around 250 individuals left - and [deeply charismatic](https://www.youtube.com/watch?v=9T1vfsHYiKY).

On the podcast I predicted they would have an excellent breeding season this year thanks to the abundance of fruiting rimu trees. That appears to be paying off already - Rakiura (24 year old legend, nine living descendants over six breeding seasons) has laid three eggs, all of them fertile, and you can [watch her live on her nest cam](https://www.doc.govt.nz/our-work/kakapo-recovery/what-we-do/kakapo-cam-rakiura-live-stream/)!

There's not much good news in the world right now so I've been spending quite a bit of time watching her sit on her eggs.

I had Claude Code [help me build a timelapse video](https://simonwillison.net/2026/Jan/25/kakapo-cam/) of footage from the nest cam. 

## New options for sandboxes

I predicted we would solve sandboxing this year - the ability to take untrusted code (produced by LLMs or other people or both) and execute it on our machines in a way that is safe and controlled.

We're off to a strong start already.

The Claude Cowork macOS application installs a complete Linux VM using Apple's Virtualization Framework in order to provide a robust sandbox.

Fly.io [launched **Sprites.dev**](https://simonwillison.net/2026/Jan/9/sprites-dev/), a platform for running coding agents (and other interesting things) in a cloud server sandbox that launches fast and features easy, fast snapshot and restore for the entire disk state. Fly CEO Kurt Mackey said that agents "don’t want containers. They don’t want “sandboxes”. They want computers."

Docker now ships a feature called [Docker Sandboxes](https://docs.docker.com/ai/sandboxes/) that "lets you run AI coding agents in isolated environments on your machine".

I remain optimistic that server-side WebAssembly runtimes will deliver the sandbox environment I want for my own efforts to run code in a controlled way. I built an experimental Python library called [Denobox](https://github.com/simonw/denobox) which can run JavaScript code and WebAssembly in a Deno subprocess sandbox. I'm more excited about the trio of [amla-sandbox](https://github.com/amlalabs/amla-sandbox), [eryx](https://github.com/eryx-org/eryx) and [localsandbox](https://github.com/coplane/localsandbox), all of which aim to make WebAssembly sandboxes conveniently available from Python code.

Luis Cardoso's [Field guide to sandboxes for AI](https://www.luiscardoso.dev/blog/sandboxes-for-ai) is worth spending some time with too.

And finally, Paul Kinlan wrote [the browser is the sandbox](https://aifoc.us/the-browser-is-the-sandbox/) ([my notes here](https://simonwillison.net/2026/Jan/25/the-browser-is-the-sandbox/)) - and built a neat prototype of a Cowork-style agent that runs entirely sandboxed by the browser using the browser's existing security model.

## Web browsers are the "hello world" of coding agent swarms

I predicted that we would see a new web browser built using primarily AI-assisted coding within three years. That prediction lasted less than a month.

The most widely covered example of this was [FastRender](https://github.com/wilsonzlin/fastrender), a project by Wilson Lin at Cursor which used literally thousands of parallel coding agents working to build a new web browser in Rust.

The term "coding agent swarms" is starting to gain traction for this - it's apparently [the name Claude Code uses](https://twitter.com/NicerInPerson/status/2014989679796347375) in a not yet released feature.

Wilson's work was primarily about figuring out the best way to coordinate large numbers of coding agents on a single project - he picked a browser because it was a sufficiently complex project.

This project inspired a lot of controversy - the initial release on GitHub didn't cleanly compile and turned out to use a number of dependencies that undermined [the Cursor CEO's tweet](https://twitter.com/mntruell/status/2011562190286045552) about it being a "from scratch" implementation.

I was impressed that [the first version I tried](https://simonwillison.net/2026/Jan/19/scaling-long-running-autonomous-coding/) was able to render my blog, and invited Wilson to participate in a video conversation about the project. The [47 minute interview](https://simonwillison.net/2026/Jan/23/fastrender/) is available on YouTube, plus I extracted some highlights from the transcript for my blog.

FastRender used thousands of parallel agents and produced around 1.6 million lines of Rust. embedding-shapes was [unimpressed by the project](https://emsh.cat/cursor-implied-success-without-evidence/) and set out to prove it could be done with significantly less resources, producing [one-agent-one-browser](https://simonwillison.net/2026/Jan/27/one-human-one-agent-one-browser/) which achieved a similar rendering quality with no dependencies outside OS graphics libraries and used just 20,000 lines of Rust.

I jokingly referred to building a web browser as the new "hello world" of parallel agent swarms, only to have embedding-shapes show that you don't need parallel agents to get good results on this task after all!

I've revised my 2029 prediction based on this: I now think we'll see a production ready web browser produced by a small team using coding agents, previously I would have been satisfied with the kind of proof-of-concept projects that we've now already seen in January 2026.

## Sam Altman addressed the Jevons paradox for software engineering

Sam Altman participated in a Town Hall session at OpenAI last week where he addressed questions from an audience. I couldn't attend in person but I submitted a question about the Jevons paradox for software engineering in advance... and Sam used it as the opening question for the session!

> Where do you fall on the Jevons paradox of software engineering? If AI makes code dramatically faster and cheaper to create, does that reduce demand for software engineers, or does cheaper custom software massively increase demand and keep engineers employed for decades?

You can [see his answer on the YouTube stream](https://www.youtube.com/live/Wpxv-8nG8ec?t=32s). His answer was less reassuring than I had hoped! He mainly leaned into the vibe-coding by non-experts side of the issue.

## Model releases and miscellaneous extras

- **[GLM-4.7-Flash](https://huggingface.co/zai-org/GLM-4.7-Flash)** is the new, smaller "flash" variant of the excellent GLM-4.7 from Z.ai. It's 62.5GB which means it's just about laptop sized, if you have a *very* beefy laptop.
- **[Kimi K2.5](https://simonwillison.net/2026/Jan/27/kimi-k25/)** from Moonshot AI may be the new best open weight model - if you can handle 595GB for 1 trillion parameters. It adds multimodal image inputs to the K2 model family and boasts of being able to manage a "self-directed agent swarm" that can orchestrate up to 100 sub-agents. 
- **[Qwen3-TTS](https://simonwillison.net/2026/Jan/22/qwen3-tts/)** is an open source text-to-speech family from Qwen with voice cloning capabilities. The 0.6B model is just 2.5GB and can run in a browser via Hugging Face.
- **[FLUX.2-klein-4B](https://simonwillison.net/2026/Jan/18/flux2-klein-4b/)** is a new Apache 2.0 licensed image generation model from Black Forest Labs. Salvatore Sanfilippo (antirez, creator of Redis) built a pure C, dependency-free implementation to run it, with assistance from Claude Code and Opus 4.5.
- Anthropic officially released **[Claude's "constitution" document](https://simonwillison.net/2026/Jan/21/claudes-new-constitution/)** - the 35,000+ token "soul document" that was previously leaked from the model's training.
- OpenAI announced that **[ads are coming to ChatGPT](https://simonwillison.net/2026/Jan/16/chatgpt-ads/)** for free accounts and the new $8/month "Go" tier.
- The **[Open Responses](https://simonwillison.net/2026/Jan/15/open-responses/)** specification launched - a vendor-neutral standard for LLM JSON APIs derived from OpenAI's Responses API, with launch partners including OpenRouter, Hugging Face, LM Studio, vLLM, Ollama, and Vercel.
- A while ago I [posed open questions](https://simonwillison.net/2025/Dec/15/porting-justhtml/) about the ethics of using LLMs to port open source libraries from one language to another. Someone challenged me to provide my own answers for them, [so I did](https://simonwillison.net/2026/Jan/11/answers/).
- I shipped **[Datasette 1.0a24](https://simonwillison.net/2026/Jan/29/datasette-1-0a24/)** with support for multipart file uploads via a new method on Datasette's Request object.
- I introduced **[gisthost.github.io](https://simonwillison.net/2026/Jan/1/gisthost/)**, an updated fork of gistpreview for rendering HTML from GitHub Gists. This is now used as the default publishing mechanism for my [claude-code-transcripts](https://github.com/simonw/claude-code-transcripts) tool, [example here](https://gisthost.github.io/?04a15bf7219a55d548df49a2260d53b9/index.html).
- Anthropic [invested $1.5 million in the Python Software Foundation](https://simonwillison.net/2026/Jan/13/anthropic-psf/) and open source security.
- Linus Torvalds [wrote about vibe-coding](https://simonwillison.net/2026/Jan/11/linus-torvalds/) a Python audio visualizer tool using Google Antigravity.
- Drew Breunig built [A Software Library with No Code](https://simonwillison.net/2026/Jan/10/software-library-with-no-code/) - a time formatting library called "whenwords" that's just a specification, an AGENTS.md and conformance tests in YAML. Pass it to a coding agent, tell it what language you need, and it generates the implementation on demand.
- Dan Shapiro proposed [The Five Levels of AI-assisted programming](https://simonwillison.net/2026/Jan/28/five-levels/), from Level 0 "Spicy Autocomplete" through Level 5 "The Dark Software Factory".

## That's it for January!

If this newsletter was useful feel free to forward it to friends who might find it useful too, especially if they might be convinced to sign up to sponsor me for the next one!
