# How I Set Up Offline Voice Dictation on Linux (Ubuntu 24.04 + Wayland)

I've been using voice dictation on my Linux desktop for a while now, and it's transformed how I work. No cloud services, no subscriptions, just press a hotkey, speak, and watch the text appear. Here's how I built it.

## The Problem

Voice dictation on Linux has always been a second-class citizen. Most solutions either require sending your audio to cloud services (privacy nightmare), don't work properly with Wayland, or are just unreliable. I wanted something that:

- Works completely offline
- Runs on Wayland (not just X11)
- Uses a simple hotkey to toggle recording
- Actually types the text into whatever window I'm focused on

## The Solution: Faster-Whisper + ydotool

The setup uses OpenAI's Whisper model (via the faster-whisper implementation) for transcription and ydotool for typing text into applications. The whole thing runs locally on CPU.

**How it works:**

1. Press `Ctrl+Shift+Space` to start recording
2. Speak naturally
3. Press `Ctrl+Shift+Space` again to stop
4. Text gets transcribed and typed into the active window

Simple.

## The Components

### 1. System Dependencies

First, the baseline packages:

```bash
sudo apt install portaudio19-dev python3-venv python3-pip git pulseaudio-utils libnotify-bin cmake libevdev-dev scdoc
```

### 2. ydotool (Built from Source)

This is the key piece for Wayland support. Unlike xdotool, ydotool works at the kernel level so it doesn't care whether you're on X11 or Wayland.

I built it from source from [the GitHub repo](https://github.com/ReimuNotMoe/ydotool) and installed it to `/usr/local/bin/`. It runs as a daemon (`ydotoold`) that handles the actual keystroke injection.

### 3. Python Environment with Faster-Whisper

The transcription happens in a Python virtual environment at `~/tools/whisper-dictation/` with these packages:

- faster-whisper (the actual speech recognition)
- pyaudio and sounddevice (audio capture)
- numpy
- pynput (for hotkey detection)

### 4. The Whisper Model

I'm using the `small` model (466MB, needs about 2GB RAM). It's a good balance between speed and accuracy. The model downloads automatically on first run and caches to `~/.cache/huggingface/hub/`.

Available options if you want to tune it:

| Model | Size | RAM | Notes |
|-------|------|-----|-------|
| tiny | 75 MB | ~1 GB | Fast but less accurate |
| base | 142 MB | ~1 GB | Decent for quick notes |
| **small** | 466 MB | ~2 GB | What I use - good balance |
| medium | 1.5 GB | ~5 GB | Better accuracy, slower |
| large-v3 | 3 GB | ~10 GB | Best accuracy, needs patience |

## The Scripts

I created a few scripts in `~/.local/bin/`:

- `dictate-start` - Starts audio recording
- `dictate-stop` - Stops recording, runs transcription, types the result
- `dictate-toggle` - Toggles between start/stop
- `dictation-listener` - Background service that listens for the hotkey

## Running It as Services

Everything runs through systemd user services so it starts automatically on login:

```bash
# Check if it's running
systemctl --user status ydotoold
systemctl --user status dictation-listener

# View logs if something's wrong
journalctl --user -u dictation-listener -f
```

## The One Gotcha: Permissions

ydotool needs access to `/dev/uinput` to inject keystrokes. This requires:

1. A udev rule at `/etc/udev/rules.d/60-uinput.rules`:
   ```
   KERNEL=="uinput", MODE="0660", GROUP="input"
   ```

2. Your user in the `input` group

3. A logout/login for the group membership to take effect

## Was It Worth It?

Absolutely. Once it's set up, it just works. I use it for:

- Quick notes and drafts
- Writing first passes of documentation
- Responding to messages when my hands are tired
- Brain dumps when I need to think out loud

The transcription quality with the `small` model is surprisingly good for everyday speech. Technical terms and proper nouns sometimes need correction, but for general dictation it's solid.

## Resources

- [faster-whisper](https://github.com/SYSTRAN/faster-whisper) - The CTranslate2-based Whisper implementation
- [ydotool](https://github.com/ReimuNotMoe/ydotool) - Linux automation that works on Wayland
- [OpenAI Whisper](https://github.com/openai/whisper) - The original model

---

*Setup completed January 2025 on Ubuntu 24.04 with Wayland.*

---

## Appendix: Prompts Used

1. "look for the document about how to set up dictation on Linux and once you find it use that to create a blog post explaining how I have set this up on Linux"
