---
title: "Voice Dictation on Linux: A Game-Changer for My Claude Code Workflow"
published: true
layout: post
date: 2026-01-08 12:00:00 +0000
description: I use Claude Code constantly and had grown accustomed to dictating on Mac. Not having dictation on Linux was painful - until I built my own solution with faster-whisper.
tags: #linux #voice-dictation #whisper #claude-code #productivity
categories: #technology #productivity #linkedin
---

I've been using Wispr Flow for voice dictation on Mac and loving it. But I also work on Linux, where Wispr Flow isn't available.

This mattered more than you might think.

I use Claude Code constantly, and I'd grown so accustomed to dictating my thoughts on Mac that working on Linux without it felt painful. Every time I sat down at my Linux machine, I'd instinctively reach for the dictation hotkey - and nothing would happen.

So I built my own offline solution using faster-whisper and ydotool.

The setup is simple: press a hotkey, speak naturally, press the hotkey again. The text gets transcribed and typed into whatever window I'm focused on.

No cloud services. No subscriptions. No internet required. Everything runs locally on CPU.

Here's what surprised me:

Wispr Flow feels instantaneous - you speak and text appears almost immediately. My Linux setup types word by word, which initially seemed like a limitation.

But I've actually grown to enjoy it. Watching each word appear gives me time to double-check as it types. If something's off, I notice immediately.

It's a different rhythm, but not a worse one.

The other surprise? Punctuation works beautifully. It knows when to put full stops, commas, and question marks without you having to say them explicitly. The text comes out feeling natural - as good as Wispr Flow in most cases.

The main components:

- **faster-whisper** for transcription (CTranslate2-based, efficient on CPU)
- **ydotool** for typing text into applications (works on Wayland)
- A simple hotkey listener running as a systemd service

Finding this solution has been a game-changer for my Linux workflow. I can finally work with Claude Code on Linux the same way I do on Mac - dictating thoughts naturally instead of typing everything out.

Voice dictation removes the input bottleneck so you can work at the speed of thought.

---

*See the [full technical setup guide](/2026/01/08/offline-voice-dictation-linux-whisper.html) for installation details.*
