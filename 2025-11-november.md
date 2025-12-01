I published [79 posts](https://simonwillison.net/2025/Nov/) on my blog in November. Here's your sponsors-only summary of the most important trends and highlights from the past month.

As always, this issue and previous issues are archived in my [simonw-private/monthly](https://github.com/simonw-private/monthly) GitHub repository.

## The best model for code changed hands four times

November was a busy month for frontier model releases, with major new releases from all three of OpenAI, Anthropic, and Google Gemini. Every AI lab has coding performance as a top priority now, presumably because AI-assisted programming has established itself as one of the most economically valuable applications of LLMs - plus performance at driving coding agents maps directly to performance at running general tools that are valuable outside of programming.

By my rating the best available coding model changed hands four times this month!

At the start of the month the coding champion was **Claude Sonnet 4.5**. **GPT-5.1** and **GPT-5.1 Codex** [caught up on 12th November](https://simonwillison.net/2025/Nov/13/gpt-51/). **Gemini Pro 3** landed with some impressive benchmark results [on 18th November](https://simonwillison.net/2025/Nov/18/gemini-3/). OpenAI responded with the horribly named **GPT-5.1-Codex-Max** [on 19th November](https://simonwillison.net/2025/Nov/19/gpt-51-codex-max/). Then Anthropic dropped **Claude Opus 4.5** [on the 24th](https://simonwillison.net/2025/Nov/24/claude-opus/), which has now established itself as my new coding favorite.

All three labs offer exceptionally strong models with their own strengths.

- Gemini Pro 3 is the best model for analyzing video and audio, and continues to have that 1 million token context window. I tried it [against a 3.5 hour council meeting recording](https://simonwillison.net/2025/Nov/18/gemini-3/#analyzing-a-city-council-meeting) and got some impressive results, though it did lose track of the timestamps for the various important moments.
- GPT-5.1 and 5.1 Codex and 5.1 Codex Max are very competitively priced - the cheapest of the big three. They are extremely capable and are available in OpenAI's Codex CLI coding agent with a generous allowance for ChatGPT subscribers.
- Claude Opus 4.5 is the most expensive but thankfully had a 3x price drop compared to the previous Opus 4, keeping it competitive with the other models. It's extraordinarily good at taking on complex coding projects that require problems to be broken down into smaller steps first. It works incredibly well inside Claude Code.

xAI's [Grok 4.1](https://x.ai/news/grok-4-1) on November 17th was notable as the *only* model from a major lab that didn't boast about its coding benchmark performance as part of the release!

## Significant open weight model releases

**[Kimi K2 Thinking](https://huggingface.co/moonshotai/Kimi-K2-Thinking)** is an impressive new model, especially given its smaller size. From [my notes](https://simonwillison.net/2025/Nov/6/kimi-k2-thinking/): "This one is only 594GB on Hugging Face - Kimi K2 was 1.03TB - which I think is due to the new INT4 quantization. This makes the model both cheaper and faster to host."

It was the first open weights model I've seen beat the current leading proprietary models on key benchmarks, and reportedly cost just $4.6 million to train (from CNBC "according to a source familiar with the matter").

You can run it locally via MLX on a pair of 512GB M3 Ultra Mac Studios - so just under $20,000 worth of local hardware.

DeepSeek released [**deepseek-ai/DeepSeek-Math-V2**](https://huggingface.co/deepseek-ai/DeepSeek-Math-V2), the first open weights model to claim a gold medal performance on the 2025 International Mathematical Olympiad (previously achieved by specialist models from Gemini and OpenAI). [My notes on that](https://simonwillison.net/2025/Nov/27/deepseek-math-v2/).

Ai2 (the Allen Institute for AI) released **Olmo 3**, the latest in their series of "fully open" models, so-called because they include the full training data and process in the release. I wrote [a longer piece](https://simonwillison.net/2025/Nov/22/olmo-3/) about that model.

## Nano Banana Pro

Google Gemini's Nano Banana, released [in August](https://developers.googleblog.com/en/introducing-gemini-2-5-flash-image/), quickly established itself as a leading model for image generation and prompt-based editing of existing images.

I had been impressed by it but hadn't clocked quite how good it was until Max Woolf published his [detailed prompting guide](https://minimaxir.com/2025/11/nano-banana-prompts/) on 13th November, showing how well it could follow extremely complex prompts describing many different aspects of an image.

A week after he published that [Nano Banana Pro](https://blog.google/technology/ai/nano-banana-pro/) came out, and it was a significant upgrade in every way. This new model can produce 2K and 4K resolution images - 4K is 5632 × 3072 pixels - and is so good at text and instruction following that it can produce single-shot explanatory infographics that are genuinely usable - something I've not seen from any other image model.

I had it [generate an infographic explaining Datasette](https://simonwillison.net/2025/Nov/20/nano-banana-pro/#creating-an-infographic) (it can run searches as part of preparing to create an image) and was astonished at how good the result was.

## Major coding projects with LLMs this month

Last month I [hinted at](https://github.com/simonw-private/monthly/blob/main/2025-10-october.md#coding-agents-and-vibe-engineering) using Claude Code for a major new Datasette feature, around SQL-driven permissions.

This month I wrote about that in detail in [A new SQL-powered permissions system in Datasette 1.0a20](https://simonwillison.net/2025/Nov/4/datasette-10a20/). This is by far the most ambitious coding project I've completed while leaning heavily on a coding agent.

Since this Datasette alpha breaks backwards compatibility with other alpha plugins I used Codex CLI to [upgrade dozens of different Datasette plugins](https://simonwillison.net/2025/Nov/6/upgrading-datasette-plugins/) to be compatible with the new alpha ([35 and counting](https://simonwillison.net/2025/Nov/11/six-coding-agents-at-once/)).

I released Datasette 0.65.2 and 1.0a21 with a fix for an [open redirect vulnerability](https://simonwillison.net/2025/Nov/5/open-redirect-datasette/).

In other Datasette ecosystem news, I [shipped sqlite-utils 4.0a1](https://simonwillison.net/2025/Nov/24/sqlite-utils-40a1/), this time built with the assistance of a release preview of Claude Opus 4.5. Part of that involved a [massive refactor](https://github.com/simonw/sqlite-utils/pull/678/files) that touched hundreds of lines of code across twenty different Python files.

I've been leaning heavily into coding agents for research projects recently, and I wrote about my pattern for those in detail in [Code research projects with async coding agents like Claude Code and Codex](https://simonwillison.net/2025/Nov/6/async-code-research/).

My [tools.simonwillison.net](https://tools.simonwillison.net/) collection gained [11 new items](https://tools.simonwillison.net/by-month#2025-11) this month. I also made some [big upgrades to my Bluesky Thread View](https://simonwillison.net/2025/Nov/28/bluesky-thread-viewer/) tool.

## Prompt injection news for November

I [wrote about two new papers concerning prompt injection](https://simonwillison.net/2025/Nov/2/new-prompt-injection-papers/): the first was [Agents Rule of Two: A Practical Approach to AI Agent Security](https://ai.meta.com/blog/practical-ai-agent-security/) by Meta AI and the second was [The Attacker Moves Second: Stronger Adaptive Attacks Bypass Defenses Against LLM Jailbreaks and Prompt Injections](https://arxiv.org/abs/2510.09023) by a mixture of authors including representatives from OpenAI, Anthropic, and Google DeepMind.

Tim Kellogg proposed [MCP Colors](https://timkellogg.me/blog/2025/11/03/colors) as a systematic way to think about the risk - if an MCP action returns untrusted content (red) it should not be allowed to influence another tool that performs actions (blue).

The Claude Opus 4.5 announcement boasted of [substantial progress in robustness against prompt injection attacks](https://simonwillison.net/2025/Nov/24/claude-opus/#still-susceptible-to-prompt-injection), but their tests still show that if an attacker gets 10 attempts they can succeed 1/3rd of the time!

Google released a new coding agent IDE alongside Gemini Pro 3 called Antigravity, with some [neat new ideas](https://simonwillison.net/2025/Nov/18/google-antigravity/) for how IDE coding agents can work. PromptArmor later [demonstrated some nasty](https://simonwillison.net/2025/Nov/25/google-antigravity-exfiltrates-data/) prompt injection attacks against this, and [Johann Rehberger showed several more](https://embracethered.com/blog/posts/2025/security-keeps-google-antigravity-grounded/).

Coding agents are one of the most concerning attack surfaces for prompt injection due to their ability to execute arbitrary commands against the host computer.

## Pelican on a bicycle variants

I [generated pelicans for a bunch of new models](https://simonwillison.net/search/?q=&tag=pelican-riding-a-bicycle&year=2025&month=11) in November, but I was also delighted to see various new variants of my LLM benchmark appear:

- [Pelican on a Bike - Raytracer Edition](https://blog.nawaz.org/posts/2025/Oct/pelican-on-a-bike-raytracer-edition/) by beetle_b rendered pelicans riding bicycles using POV-Ray, [my notes here](https://simonwillison.net/2025/Nov/9/pelican-on-a-bike-raytracer-edition/).
- [Agentic Pelican on a Bicycle](https://simonwillison.net/2025/Nov/11/agentic-pelican-on-a-bicycle/) by Robert Glaser runs vision LLMs in a loop to give them chances to tweak and improve their original image.
- Tom Gally [created a benchmark with 30 variations of animals doing things with heavy equipment](https://simonwillison.net/2025/Nov/25/llm-svg-generation-benchmark/) and ran that against 9 different frontier models.

I also wrote the definitive answer to the common question I am asked about the benchmark: [What happens if AI labs train for pelicans riding bicycles?](https://simonwillison.net/2025/Nov/13/training-for-pelicans-riding-bicycles/)

## Two YouTube videos and a podcast

I published two YouTube videos this month:

- [Video + notes on upgrading a Datasette plugin for the latest 1.0 alpha, with help from uv and OpenAI Codex CLI](https://simonwillison.net/2025/Nov/6/upgrading-datasette-plugins/) demonstrates running parallel agents (with OpenAI Codex CLI) to apply an automated upgrade to dozens of Datasette plugins.
- [How I automate my Substack newsletter with content from my blog](https://simonwillison.net/2025/Nov/19/how-i-automate-my-substack-newsletter/) demonstrates my custom Observable notebook + Datasette mechanism for transforming content from my blog for my weekly-ish newsletter.

I was also a guest on the new [Data Renegades podcast](https://www.heavybit.com/library/podcasts/data-renegades) with CL Kao and Dori Wilson - I used Opus 4.5 to [extract highlight quotes from the recording](https://simonwillison.net/2025/Nov/26/data-renegades-podcast/) which worked very well.

## Miscellaneous extras

- **PyCon US 2026** is in Long Beach, California from May 13th-19th and [just opened the Call for Proposals](https://pycon.blogspot.com/2025/10/pycon-us-2026-call-for-proposals-now.html). The deadline for that is December 19th 2025. There are new tracks for AI and security this year. I'm hoping we can get at least one big new AI company to sponsor the event - here's [the sponsorship prospectus](https://s3.dualstack.us-east-2.amazonaws.com/pythondotorg-assets/media/files/psf_sponsor_prospectus_25-26_final_compressed.pdf).
- **ChatGPT turned three years old** on the 30th of November. I put together [a birthday post](https://simonwillison.net/2025/Nov/30/) that highlighted how uncertain OpenAI were at the time that anyone would care. It attracted a million signups in the first five days and is now at 800 million monthly active users.
- [You Should Write An Agent](https://fly.io/blog/everyone-write-an-agent/) by Thomas Ptacek makes a strong case that implementing a simple tools-in-a-loop agent is a great way to learn more about LLMs and their capabilities.
- [Scaling HNSWs](https://antirez.com/news/156) by Redis creator Salvatore Sanfilippo provides some deep technical insights into the implementation of the new Redis vector sets.
- I published a very specific TIL on [Using Codex CLI with gpt-oss:120b on an NVIDIA DGX Spark via Tailscale](https://til.simonwillison.net/llms/codex-spark-gpt-oss).
- Anthropic published [Code execution with MCP: Building more efficient agents](https://www.anthropic.com/engineering/code-execution-with-mcp) on their engineering blog, describing an alternative mechanism for using MCPs via code that helps avoid the problem of them polluting the default system prompt with too much text. Kenton Varda [noted](https://x.com/kentonvarda/status/1987208904724652273) that a big advantage of MCP over OpenAPI is that it is very clear about auth. Steve Krouse [pointed out](https://simonwillison.net/2025/Nov/12/steve-krouse/) that MCPs can break backwards compatibility with abandon since the models are asked to figure out how to use them every time they are invoked.

## Tools I'm using at the moment

On my laptop I'm spending almost all of my coding time in either Claude Code or Codex CLI in a terminal window. I tried Google Antigravity and I have VS Code running to look at the code but 95% of my edits are now made by the two major terminal coding agents.

I'm mostly using Claude Code, but I fire up Codex CLI occasionally for smaller tasks purely to save on my Claude allowance.

I've also been getting a great deal of work done on my iPhone. The OpenAI iPhone app has a Codex tab now and the Claude app can interact with Claude Code. This means I can pop open either app, select a GitHub repository, run a prompt and wait for a PR to pop up a few minutes later.

I'm using GitHub's new Copilot agent as well, which lets you create an issue on GitHub and then assign Copilot to it and have it work independently and file a PR with the result. Here's [a recent example issue](https://github.com/simonw/llm-prices/issues/35) against my [llm-prices.com](https://www.llm-prices.com/) project, and [the resulting PR](https://github.com/simonw/llm-prices/pull/36). This works really well for small changes and is convenient, especially on my phone. It uses Playwright to add screenshots of its work to the PR, which makes for a handy form of documentation.

In terms of models I'm defaulting to Claude Opus 4.5 for code and GPT-5.1 Thinking for search. 

I used [LM Studio](https://lmstudio.ai/) to try out a few local models this month. They're doing a better job than Ollama at [updating their model catalog](https://lmstudio.ai/models) with interesting new models as soon as they are released.

## That's it for November!

If this newsletter was useful feel free to forward it to friends who might find it useful too, especially if they might be convinced to sign up to sponsor me for the next one!

Thanks for supporting my work!

Simon Willison - [simonwillison.net](https://simonwillison.net/)

I'm available for consulting calls over Zoom or similar, you can contact me at contact@simonwillison.net
