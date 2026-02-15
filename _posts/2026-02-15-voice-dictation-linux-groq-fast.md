---
title: "Making Voice Dictation on Linux Actually Fast: From Local Whisper to Groq Cloud"
published: true
layout: post
date: 2026-02-15 06:00:00 +0000
description: My Linux voice dictation setup worked, but it wasn't fast enough. Here's how switching to Groq's cloud API and clipboard pasting made it genuinely quick — and the surprising discovery about where the real bottleneck was.
tags: #linux #voice-dictation #whisper #groq #productivity
categories: #technology #productivity
---

Last month I wrote about [building an offline voice dictation setup on Linux](/2026/01/08/offline-voice-dictation-linux-whisper.html) using whisper.cpp and ydotool. It worked. I used it every day.

But it wasn't fast enough.

The transcription was decent, not great. Technical terms would get mangled. And there was this pause after stopping the recording — a second or two of silence before anything happened, then text appearing character by character. On a short phrase it was fine. On a paragraph, I'd be sitting there watching it type for fifteen seconds.

I wanted it to feel closer to Wispr Flow on my Mac. So I spent an evening making it better, with Claude Code doing most of the heavy lifting.

## The Accuracy Fix: Going Cloud

The original setup used whisper.cpp with the `base` model — 142MB, running locally on CPU. It was fine for casual dictation but stumbled on proper nouns and technical terms. The `large-v3` model would fix that, but at 3GB it'd be painfully slow on CPU without a GPU.

Then I looked at cloud options.

Groq offers Whisper large-v3 through their API, and they have a free tier that's generous enough that you'll never hit the limits with dictation:

- 2,000 requests per day
- Several hours of audio per day
- No credit card required

For context, heavy dictation use is maybe 30 minutes of audio per day. The free tier covers far more than that.

The change to the daemon was minimal — replace the local whisper-cli call with a curl to Groq's API:

```bash
TEXT=$(curl -s https://api.groq.com/openai/v1/audio/transcriptions \
    -H "Authorization: Bearer $GROQ_API_KEY" \
    -F file="@$RECORDING_FILE" \
    -F model="whisper-large-v3" \
    -F response_format="text" \
    -F language="en")
```

Immediately the transcription quality jumped. Punctuation was better. Capitalisation was more consistent. Technical terms I use daily — Wayland, PipeWire, Obsidian — were handled correctly most of the time.

## The Speed Surprise

With the cloud API working, I expected the network round-trip to be the bottleneck. Record audio, upload the file, wait for Groq, get the text back.

So I checked the logs:

```
06:21:19  Stopping recording...
06:21:20  Transcribing via Groq API...
06:21:21  Transcribed: It is quicker than before but not as quick as...
06:21:38  Typing complete
```

The API call took about one second. Upload plus transcription. For a 43-second recording.

The typing took **seventeen seconds**.

The bottleneck wasn't the cloud at all. It was ydotool simulating keyboard input character by character, with a small delay between each word. For a long dictation, that added up to an absurd amount of waiting.

## The Fix Nobody Talks About

The solution was obvious once I saw the numbers: don't type the text, paste it.

```bash
# Instead of: ydotool type -- "$TEXT"
printf '%s' "$TEXT" | wl-copy
ydotool key 29:1 42:1 47:1 47:0 42:0 29:0  # Ctrl+Shift+V
```

Copy the text to the Wayland clipboard, then simulate a single Ctrl+Shift+V keystroke. The text appears instantly regardless of length.

Why Ctrl+Shift+V instead of Ctrl+V? Because terminals use Ctrl+Shift+V for paste. And on most Linux applications, Ctrl+Shift+V works as "paste as plain text" — which is exactly what we want. One shortcut that works everywhere.

There was one catch: pasting clobbers whatever's on the clipboard. So the daemon now saves the clipboard contents before pasting and restores them afterwards:

```bash
OLD_CLIP=$(wl-paste --no-newline 2>/dev/null)
printf '%s' "$TEXT" | wl-copy
sleep 0.1
ydotool key 29:1 42:1 47:1 47:0 42:0 29:0  # Ctrl+Shift+V
sleep 0.2
printf '%s' "$OLD_CLIP" | wl-copy
```

No clipboard pollution. The restore happens after the paste, so you don't notice any delay.

## Teaching Whisper Your Vocabulary

Even with large-v3, some words kept getting transcribed wrong. "Groq" became "grok". Fair enough — they sound identical, and one is a real English word.

Whisper's API accepts a `prompt` parameter — a text hint that guides transcription. My first attempt was a comma-separated word list:

```
Groq, Obsidian, Claude, Wayland, Hetzner
```

It didn't help. "Groq" still came out as "grok".

What worked was a **sentence-style prompt** that uses the words in context:

```
I'm using the Groq API with Whisper for dictation on Ubuntu with Wayland.
Tools include Obsidian, Claude, ydotool, Hetzner, CCCL, parecord, and PipeWire.
```

With this prompt, "Groq" was spelled correctly every time. Whisper uses the prompt as context, and a natural sentence gives it much stronger signals than a bare list.

I keep this in a file at `~/.config/groq/prompt_hints`. The daemon reads it fresh on every transcription, so I can add new words anytime without restarting anything.

## The Claude Code Factor

I should mention: I didn't write most of these changes by hand.

I described what I wanted to Claude Code, and it researched the cloud options, compared pricing, modified the daemon script, figured out the ydotool keycodes for Ctrl+Shift+V, added the clipboard save/restore logic, and updated my documentation. The whole process — from "I wonder if I can use Groq" to a working, documented setup — took about an hour of conversation.

It even created a custom skill so I can add new prompt hints by typing `/add-prompt-hint Kubernetes, kubectl` and it weaves the words naturally into my existing prompt sentence.

This is exactly the workflow voice dictation enables. I speak my intent, Claude Code figures out the implementation. The faster I can get words into the terminal, the faster this loop runs.

## Before and After

| | Before | After |
|---|---|---|
| **Transcription** | Local whisper.cpp (base, 142MB) | Groq cloud API (large-v3) |
| **Accuracy** | ~13% WER | ~8.4% WER |
| **Transcription time** | ~1.1s for 2s audio | ~1s for 10s audio (including upload) |
| **Text output** | ydotool, character by character | Clipboard paste, instant |
| **Long text delay** | ~17s for a paragraph | <0.5s |
| **Cost** | Free (local) | Free (Groq free tier) |
| **Internet required** | No | Yes |
| **Prompt hints** | None | Sentence-style vocabulary hints |

The trade-off is clear: I gave up offline capability for significantly better accuracy and speed.

A note on privacy: Groq doesn't retain API data by default, and you can enable Zero Data Retention if you want stronger guarantees. But your audio does leave your machine — something to be aware of if that matters to your use case. For me, dictating notes and messages at a desk with a reliable internet connection, that's an acceptable trade-off. And the local whisper.cpp setup is still installed as a fallback if I ever need fully offline transcription.

## The Setup Today

The architecture is simpler than before:

1. Tap Caps Lock to start recording
2. Speak naturally
3. Tap Caps Lock to stop
4. Audio uploads to Groq (~1 second)
5. Text appears instantly via clipboard paste
6. Done sound plays

Everything still runs as systemd user services. The daemon is still a bash script. The only new dependency is `wl-clipboard` (and `curl`, which was already there).

If you're running the setup from my previous post, the upgrade is straightforward: swap the whisper-cli line for a curl call, add the clipboard paste logic, and create your Groq API key at [console.groq.com](https://console.groq.com). The full daemon script is in my [voice dictation documentation](https://github.com/vikrampawar).

## Resources

- [Groq API — Speech to Text](https://console.groq.com/docs/speech-to-text) — Free Whisper large-v3 API
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard) — Wayland clipboard utilities
- [Previous post: Offline Voice Dictation on Linux](/2026/01/08/offline-voice-dictation-linux-whisper.html)
- [Wispr Flow](https://wispr.com) — The Mac dictation tool that started this journey

---

*Updated February 2026 on Ubuntu 24.04 with Wayland.*
