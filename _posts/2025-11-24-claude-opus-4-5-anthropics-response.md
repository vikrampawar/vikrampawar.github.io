---
title: "Claude Opus 4.5: Anthropic's Response to GPT-5.1 and Gemini 3"
published: true
layout: post
date: 2025-11-24 06:00:00 +0000
description: Anthropic drops Claude Opus 4.5 with state-of-the-art coding performance, 66% price reduction, and capabilities that score higher than human candidates on internal engineering exams. The gap between what AI can do and what we're using it for keeps widening.
tags: #anthropic #claude #opus #ai #coding #agents #pricing
categories: #technology #ai
---

Anthropic just dropped Claude Opus 4.5 and there's a lot to unpack here.

The headline is clear. This is now state-of-the-art for coding, agents, and computer use. But what caught my attention goes deeper than benchmark numbers.

On real-world software engineering (SWE-bench Verified), Opus 4.5 hits 80.9%, outperforming GPT-5.1-Codex-Max at 77.9% and Gemini 3 Pro at 76.2%. More impressive is what happened on Anthropic's internal engineering take-home exam. Using parallel test-time compute, the model scored higher than any human candidate who has ever taken the test. That's a statement.

The pricing shift is massive. Down from $15/$75 to $5/$25 per million tokens. That's a 66% reduction making frontier capabilities genuinely accessible for production workloads.

What the testers consistently reported was that Opus 4.5 handles ambiguity without hand-holding. Point it at a complex multi-system bug and it figures out the fix. Tasks that were impossible for Sonnet 4.5 weeks ago are now achievable. The feedback keeps coming back to the same phrase. It just gets it.

Here's where it gets interesting. Opus 4.5 at medium effort matches Sonnet 4.5 performance while using 76% fewer output tokens. When you factor in the new pricing alongside that token efficiency, Opus 4.5 might actually be cheaper than Sonnet 4.5 for equivalent tasks. Run the numbers yourself.

Claude Code gets Plan Mode which builds precise plans and executes more thoroughly. It asks clarifying questions upfront, creates an editable plan.md file, then executes. Claude Code is now in the desktop app enabling multiple local and remote sessions in parallel. One agent fixes bugs, another researches GitHub, a third updates docs.

For those hitting conversation limits, Claude now automatically summarizes earlier context so you can keep going. Claude for Chrome browser automation is now available to all Max users. Claude for Excel expanded to Max, Team, and Enterprise with pivot table support.

On the safety front, Opus 4.5 shows improved resistance to prompt injection and lower rates of concerning behaviour in misalignment evaluations. Anthropic calls it their safest release to date.

The timing is significant. Google's Gemini 3 just shook up the market. OpenAI released GPT-5.1 days ago. This is Anthropic's response and they're not just matching the competition. They're setting the pace on software engineering where it matters most for enterprise adoption.

For those building with AI, the message is clear. The gap between what AI can do and what we're actually using it for keeps widening. Time to close it.

What are you building with these new capabilities?

[Read the full announcement from Anthropic](https://www.anthropic.com/news/claude-opus-4-5)
