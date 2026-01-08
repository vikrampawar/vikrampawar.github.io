---
title: "Offline Voice Dictation on Linux: My Whisper-Based Alternative to Wispr Flow"
published: true
layout: post
date: 2025-01-08 10:00:00 +0000
description: After discovering Wispr Flow on Mac, I needed something similar for Linux. Here's how I built an offline voice dictation setup using faster-whisper that works beautifully on Wayland.
tags: #linux #voice-dictation #whisper #productivity #tools
categories: #technology #productivity
---

A few months ago, I wrote about discovering [Wispr Flow](/2025/11/10/the-discovery-wispr-flow.html) and how it changed my workflow on Mac. The problem? I also work on Linux, and Wispr Flow isn't available there.

I needed something that worked offline, respected my privacy, and just... worked.

## The Linux Gap

Voice dictation on Linux has always been a second-class citizen. Most solutions either send your audio to cloud services (privacy nightmare), don't work properly with Wayland, or are just unreliable.

After some research, I found a solution that actually delivers: **faster-whisper + ydotool**.

## How It Compares to Wispr Flow

Let me be honest about the differences.

Wispr Flow feels instantaneous—you speak, and the text appears almost immediately. My Linux setup types word by word, which initially seemed like a limitation.

But here's the thing: I've actually grown to enjoy the slower pace.

Watching each word appear gives me time to double-check as it types. If something's off, I notice immediately rather than finding mistakes after a wall of text has appeared. It's a different rhythm, but not a worse one.

The transcription quality is excellent—surprisingly close to Wispr Flow for everyday speech. Technical terms and proper nouns sometimes need correction, but for general dictation it's solid.

One thing that surprised me: the punctuation is handled beautifully. It knows when to put full stops, commas, and question marks without you having to say them explicitly. The text comes out feeling natural and readable, matching what I'd expect from Wispr Flow.

## The Setup

The workflow is simple:

1. Press `Ctrl+Shift+Space` to start recording
2. Speak naturally
3. Press `Ctrl+Shift+Space` again to stop
4. Text gets transcribed and typed into the active window

Everything runs locally on CPU. No cloud services, no subscriptions, no internet required.

### The Components

**ydotool** is the key piece for Wayland support. Unlike xdotool, it works at the kernel level so it doesn't care whether you're on X11 or Wayland. I built it from source from [the GitHub repo](https://github.com/ReimuNotMoe/ydotool).

**faster-whisper** handles the actual transcription—it's a CTranslate2-based implementation of OpenAI's Whisper model that runs efficiently on CPU.

I'm using the `small` model (466MB, needs about 2GB RAM). It's a good balance between speed and accuracy. You can go smaller for faster results or larger for better accuracy:

| Model | Size | RAM | Notes |
|-------|------|-----|-------|
| tiny | 75 MB | ~1 GB | Fast but less accurate |
| base | 142 MB | ~1 GB | Decent for quick notes |
| **small** | 466 MB | ~2 GB | What I use - good balance |
| medium | 1.5 GB | ~5 GB | Better accuracy, slower |
| large-v3 | 3 GB | ~10 GB | Best accuracy, needs patience |

### System Dependencies

```bash
sudo apt install portaudio19-dev python3-venv python3-pip git pulseaudio-utils libnotify-bin cmake libevdev-dev scdoc
```

### The One Gotcha: Permissions

ydotool needs access to `/dev/uinput` to inject keystrokes. This requires:

1. A udev rule at `/etc/udev/rules.d/60-uinput.rules`:
   ```
   KERNEL=="uinput", MODE="0660", GROUP="input"
   ```

2. Your user in the `input` group

3. A logout/login for the group membership to take effect

### Running as Services

Everything runs through systemd user services so it starts automatically on login:

```bash
# Check if it's running
systemctl --user status ydotoold
systemctl --user status dictation-listener

# View logs if something's wrong
journalctl --user -u dictation-listener -f
```

## Was It Worth It?

Absolutely. Once it's set up, it just works. I use it for:

- Quick notes and drafts
- Writing first passes of documentation
- Responding to messages when my hands are tired
- Brain dumps when I need to think out loud

The word-by-word typing that seemed like a limitation? It's become a feature. I'm more present with what I'm dictating, catching errors in real-time rather than after the fact.

Different from Wispr Flow, but solving the same problem: removing the input bottleneck so I can work at the speed of thought.

## Resources

- [faster-whisper](https://github.com/SYSTRAN/faster-whisper) - The CTranslate2-based Whisper implementation
- [ydotool](https://github.com/ReimuNotMoe/ydotool) - Linux automation that works on Wayland
- [OpenAI Whisper](https://github.com/openai/whisper) - The original model

---

*Setup completed January 2025 on Ubuntu 24.04 with Wayland.*
