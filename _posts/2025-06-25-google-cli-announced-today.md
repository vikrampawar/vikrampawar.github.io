

Google announced [Gemini CLI](https://blog.google/technology/developers/introducing-gemini-cli-open-source-ai-agent/) which appears to be direct competitor of Claude Code.

As I'm focussing on Claude Code as mentioned in the [text](2025-06-19-the-focus-experiment.md) and Gemini CLI is a direct competitor. It's free version is quite generous and should be good enough for most developers. Moreover I have a google workspace account through my [company account](http://rumq.net).

It's command line based, so it has all the advantages I mentioned in this [post](2025-06-15-why-command-line-is-perfect-interface-ai-coding-assistants.md).

It's like a double edged sword. Now Gemini CLI feels so much like Claude Code. It's also very easy to be running both at the same time and alternate as when required without loosing the flow.

Just ironic that Google released this product on the same day I chose the max plan as mentioned in the [post](2025-06-23-moving-to-claude-code-max-plan.md).

It doesn't have other Anthropic based advantages, but it can benefit from vertical integration as it uses the Google models and for workspace account its Google Pro 2.5.

When I saw the announcement, I quickly checked hacker news and found this [entry](https://news.ycombinator.com/item?id=44376919).

The main points were
* Google can use data prompts etc for training on the free google accounts not so if you use workspace account.
* There's a lot of confusion around google product offerings
* Issues around workspace account authentications

I was dreading I'll get dragged into a rabbit hole of Google account management. I've had some bad experiences in the past which is why I don't use it much beyond company email and google meetings. But now, all the Google Pro 2.2.5 goodness that I've been hearing about can be tested.

Luckily installation straightforward, just the single npm command. I did face authentication issue but that was quickly resolved by setting  GOOGLE_CLOUD_PROJECT variable which I set to existing google project.

One undoubted advantage will be having access to Google search which you'll see listed when you type '/tools'.

Most slash commands are intuitive and similar to Claude Code.

Before I installed I tried to see what Claude and Gemini deep research return for the below prompt. Claude returned a highly readable [document](https://claude.ai/public/artifacts/c48f6506-5c83-4a51-b5e5-0f7116cdbbeb) while Gemini returned a [thesis](https://docs.google.com/document/d/1LG8YIN48bYOsn_TkGrfjrkDZjXngQvySHQy_OAd20ek/edit?usp=sharing) which didn't look inviting. However it redeemed itself by offering many alternatives one of which was a webpage which I asked it to create and have shared [here](https://sites.google.com/rumq.net/gemini-cli-research/home). It was easy to understand as presented required information in a digestible manner.

The main points were

Claude has a better SWE performance *
  (73 vs 63 %) and accuracy of code while Gemini has a high 1M token context window.
