# LLM digest: February 2026

I published [95 posts](https://simonwillison.net/2026/Feb/) on my blog in February. Here's your sponsors-only summary of the most important trends and highlights from the past month.

As always, this issue and previous issues are archived in my [simonw-private/monthly](https://github.com/simonw-private/monthly) GitHub repository.

## More OpenClaw, and Claws in general

OpenClaw featured heavily [in my January edition](https://github.com/simonw-private/monthly/blob/main/2026-01-january.md). The project continued to make waves in February, with OpenAI [hiring OpenClaw creator Peter Steinberger](https://steipete.me/posts/2026/openclaw) to work on consumer-facing personal agents and plans for OpenClaw itself to move to a foundation.

It also spawned a number of copycat projects, inspiring Andrej Karpathy to [declare "Claw" the obvious name](https://simonwillison.net/2026/Feb/21/claws/) for the entire category of personal digital assistants (he likes [NanoClaw](https://github.com/qwibitai/nanoclaw)). Anecdotal reports circulated of Mac Minis selling heavily in both San Francisco [and NYC](https://x.com/mattshumer_/status/2028232768962843026), with store employees attributing those sales to people buying machines to run their Claws. Stock in Raspberry Pi [spiked as well](https://simonwillison.net/2026/Feb/22/raspberry-pi-openclaw/).

(A friend observed that this is looking similar to Tamagotchi, with people buying a Mac Mini as an aquarium for their new digital pets.)

Stories of misbehaving Claws continued to circulate. One Claw had its PR rejected to a popular open source project and responded [by posting a hit piece about the rejecting maintainer on its blog](https://simonwillison.net/2026/Feb/12/an-ai-agent-published-a-hit-piece-on-me/). Summer Yue's Claw [deleted most of her inbox](https://simonwillison.net/2026/Feb/23/summer-yue/) after compaction summarized out the instruction "don't action until I tell you":

> I had to RUN to my Mac mini like I was defusing a bomb.

The big challenge remains the same: can anyone design and ship a Claw that is usable by regular people and *doesn't* put their reputation and all of their private information at risk?

Meanwhile Anthropic shipped some Claw-like features for their own apps. Claude Code [can now be used in "remote" mode](https://simonwillison.net/2026/Feb/25/claude-code-remote-control/) where the agent runs on your own machine and you can send it prompts from your phone, and Claude Cowork grew a scheduled task feature. Neither of these work unless your machine stays powered on.

## I started a not-quite-a-book about Agentic Engineering

I blog a lot about coding agents, but blog posts are temporal by their nature. I've long wanted a format for content on my blog that is a little more evergreen and can be updated over time.

I had Claude Code build me a new feature called "Guides", where each guide is a collection of chapters and chapters are effectively blog posts with less prominent dates and a loose promise to keep updating in the future.

My first guide, [introduced here](https://simonwillison.net/2026/Feb/23/agentic-engineering-patterns/), is called **[Agentic Engineering Patterns](https://simonwillison.net/guides/agentic-engineering-patterns/)**. It's six chapters and an appendix so far and I'm adding a few new chapters every week. Here's the table of contents so far:

- **Principles**
    1.  [Writing code is cheap now](https://simonwillison.net/guides/agentic-engineering-patterns/code-is-cheap/) talks about how outputting code is cheap now, but writing *good* code remains costly. How does software engineering change now that the act of churning out initial working code is no longer the bottleneck?
    2.  [Hoard things you know how to do](https://simonwillison.net/guides/agentic-engineering-patterns/hoard-things-you-know-how-to-do/) describes my career-long strategy of building up a library of examples of things I know how to do, which turns out to benefit working with agents as you can have them recombine things from your collection.
- **Testing and QA**
    1.  [Red/green TDD](https://simonwillison.net/guides/agentic-engineering-patterns/red-green-tdd/) discusses how "Use red/green TDD" is a four word prompting pattern which can get better results out of an agent.
    2.  [First run the tests](https://simonwillison.net/guides/agentic-engineering-patterns/first-run-the-tests/) covers similar ground, emphasizing how automated tests that the agent habitually runs are necessary, not optional.
- **Understanding code**
    1.  [Linear walkthroughs](https://simonwillison.net/guides/agentic-engineering-patterns/linear-walkthroughs/) shows how having an agent "plan a linear walkthrough of the code" can help explain code in a more productive way.
    2.  [Interactive explanations](https://simonwillison.net/guides/agentic-engineering-patterns/interactive-explanations/) covers reducing cognitive debt by having agents build interactive, animated demos of more complex code features.

- **Appendix**
    1.  [Prompts I use](https://simonwillison.net/guides/agentic-engineering-patterns/prompts/) is the start of a collection of some of my own favorite prompts - so far it has one for building artifacts (HTML tools) and one that I use for proofreading.

Also new on my blog: I added a [feature I'm calling Beats](https://simonwillison.net/2026/Feb/20/beats/) which adds links to my software releases, TILs, tools, research reports and museum visits to my blog in various places.

I started [accepting weekly sponsors for my blog](https://simonwillison.net/2026/Feb/19/sponsorship/), via a hopefully non-intrusive banner at the top of each page. So far I've accepted sponsorship from [Teleport](https://goteleport.com/) and [Augment Code](https://www.augmentcode.com/).

## StrongDM, Showboat and Rodney

In [How StrongDM’s AI team build serious software without even looking at the code](https://simonwillison.net/2026/Feb/7/software-factory/) I wrote about how a small team at StrongDM have been trying radical new approaches to agentic engineering where the two rules are "Code must not be written by humans" and "Code must not be reviewed by humans". That second one is a frightening constraint, especially given that they build software relating to security!

If you're not reviewing the code, how do you ensure that it works correctly and is of sufficient quality?

The question "how can my agents demonstrate the quality of their work to me" is a *really* interesting one. I've started thinking about this in terms of my past experience working at large companies, where my team would frequently rely on services built by other teams without first reviewing every line of code they had written.

A team of humans can build trust over time and take accountability for their work. Can a team of agents do the same thing?

This question inspired me to build a new project called **[Showboat](https://simonwillison.net/2026/Feb/10/showboat-and-rodney/)**. Showboat is a CLI utility that lets agents create a markdown file and then write commands (and images) to it, where each command is recorded along with its output.

This is intended to build a demonstration of the work they have done. I've been using it on an almost daily basis since I created it 2.5 weeks ago and it seems to work *really well*. Some examples:

- [sqlite-chronicle trigger demos](https://github.com/simonw/sqlite-chronicle/blob/main/examples/insert-or-replace.md) is a Showboat document demonstrating the latest behavior of my [sqlite-chronicle](https://github.com/simonw/sqlite-chronicle) project for tracking timestamped changes to database tables using SQLite triggers.
- [datasette-files Filesystem Storage Demo](https://github.com/datasette/datasette-files/blob/main/demos/filesystem-storage.md) demonstrates my new [datasette-files](https://github.com/datasette/datasette-files) Datasette plugin, including curl APIs and screenshots of the in-progress UI.
- [Present: A Code Walkthrough](https://github.com/simonw/present/blob/main/walkthrough.md) is a Showboat linear walkthrough of the code for my new [Present.app](https://github.com/simonw/present) vibe coded macOS app, introduced in [I vibe coded my dream macOS presentation app](https://simonwillison.net/2026/Feb/25/present/).

The Showboat pattern makes it important to be able to automate a browser against a new feature in order to exercise that feature and take screenshots. [Rodney](https://github.com/simonw/rodney) is Showboat's sister-project, providing a CLI tool for Chrome browser automation that's designed for use by Claude Code and similar coding agents.

I also built [Chartroom](https://simonwillison.net/2026/Feb/17/chartroom-and-datasette-showboat/#chartroom) for generating charts to use in Showboat documents, and [datasette-showboat](https://simonwillison.net/2026/Feb/17/chartroom-and-datasette-showboat/#datasette-showboat) to display live updating Showboat documents (including screenshots) while they are being constructed by Claude Code for web.

## Kākāpō breeding season

The rare New Zealand dumpy flightless parrot news is good! After no new chicks for *four years* (due to a lack of mass rimu fruiting) the first chick hatched on Valentine's Day. We have since had more than ten, including two that are now visible on [Rakiura's nest cam](https://www.youtube.com/watch?v=BfGL7A2YgUY).

My neighbor Karen James made me a [quite incredible ceramic mug](https://simonwillison.net/2026/Feb/8/kakapo-mug/) to celebrate the 2026 breeding season.

## Model releases

Plenty of significant new releases in February.

- 5th February saw both [**Claude Opus 4.6** and **OpenAI Codex 5.3**](https://simonwillison.net/2026/Feb/5/two-new-models/). These are *excellent models* for code, and I'm finding them indistinguishable in terms of what they can do.
- **GLM-5** [landed on the 11th](https://simonwillison.net/2026/Feb/11/glm-5/), MIT licensed and 744B parameters / 1.51TB on Hugging Face. Z.ai promoted this one as good for "agentic engineering", which was the point where I decided that term was a keeper.
- OpenAI [released **GPT‑5.3‑Codex‑Spark**](https://simonwillison.net/2026/Feb/12/codex-spark/) on the 12th, the first fruit of their new collaboration with custom hardware company Cerebras. This model runs at 1,000 tokens/second! Its quality is not as good as regular GPT-5.3 Codex (as illustrated by its pelican) but this represents an exciting new era of high speed models.
- **Gemini 3 Deep Think** [on the 12th](https://simonwillison.net/2026/Feb/12/gemini-3-deep-think/) is Google's latest long-execution model. It drew me the best pelican riding a bicycle I've seen from a model yet.
- ... but it turned out Deep Think was a preview of **Gemini 3.1 Pro**, Google's new flagship released on [the 19th](https://simonwillison.net/2026/Feb/19/gemini-31-pro/). Their launch video included not just a pelican riding a bicycle but also a frog on a penny-farthing and a giraffe driving a tiny car and an ostrich on roller skates and a turtle kickflipping a skateboard and a dachshund driving a stretch limousine. I think they may have been testing against my benchmark!
- Anthropic [released **Claude Sonnet 4.6**](https://simonwillison.net/2026/Feb/17/claude-sonnet-46/) on the 17th, sticking to the Sonnet family's lower price but claiming to offer similar performance to November's Opus 4.5.
- Qwen released [the first in the Qwen 3.5 series](https://simonwillison.net/2026/Feb/17/qwen35/) on the 17th, **Qwen3.5-397B-A17B**. It has since been joined by [a flurry of smaller siblings](https://huggingface.co/collections/Qwen/qwen35) in 122B, 35B, 27B, 9B, 4B, 2B, 0.8B sizes. I'm hearing positive noises about the 27B and 35B models for coding tasks that still fit on a 32GB/64GB Mac, but I've not put them through their paces myself yet.

In two more pieces of model performance news: Anthropic introduced [a fast mode](https://simonwillison.net/2026/Feb/7/claude-fast-mode/) for Opus 4.6 offering faster responses (2.5x) at a higher price, and a new Canadian startup Taalas demonstrated hardware [serving Llama 3.1 8B at 17,000 tokens/second](https://simonwillison.net/2026/Feb/20/taalas/).


I started a new [llm-performance](https://simonwillison.net/tags/llm-performance/) tag to track this topic.

## What I'm using, February 2026 edition

I'm mostly all-in on **Claude Opus 4.6** running in Claude Code, mainly using Claude Code for web via the Claude iOS and desktop apps.

I use Claude Code for web because it's the ideal solution to the security challenges of running an agent. It only has access to the code that has been checked out into the container running on Anthropic's server, so there is minimal risk from mistakes or prompt injection attacks. This means I can run it with a wide open network policy, and it already runs with `--dangerously-skip-permissions`. This gives me effectively my own miniature version of OpenClaw, albeit without the ability to run scheduled tasks.

I've been firing up OpenAI Codex 5.3 as well, which I'm finding indistinguishable from Opus 4.6 in terms of capabilities. I had it run a security review of some complex code recently and it made some excellent recommendations for things that Opus had missed.

## That's it for February!

If this newsletter was useful feel free to forward it to friends who might find it useful too, especially if they might be convinced to sign up to sponsor me for the next one!
