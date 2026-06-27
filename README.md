# 🌅 Welcome Banner

> A dynamic, colourful terminal welcome dashboard for WSL/Linux — greets you with your name, the live date & time, and today's tasks every time you open your shell.

![Bash](https://img.shields.io/badge/Bash-5.x-4EAA25?logo=gnu-bash&logoColor=white)
![Platform](https://img.shields.io/badge/platform-Linux%20%7C%20WSL-blue)
![License](https://img.shields.io/badge/license-MIT-green)

---

## 📖 Overview

`welcome` is a lightweight Bash script that turns a plain terminal prompt into a personalised dashboard. It runs automatically whenever you open an interactive shell and shows:

- A coloured, framed greeting with your name
- The current date and time (refreshed on every launch)
- Today's pending tasks, read from a `todo.md` file

It is designed to be **safe** (degrades gracefully when files are missing), **portable** (pure Bash, no external dependencies), and **fast** (runs in milliseconds).

## 🖼️ Demo

```text
===================================
       Welcome back, Rahim!
-----------------------------------
   Date : Saturday, 27 June 2026
   Time : 10:42 PM
   Today's tasks:
    0. Wake up before the sun kicks on your face.
    1. Brush teeth and wash up.
    2. Force your lazy body to move.
    3. Eat healthy, nutritious food.
    4. Drink plenty of clean water.
    5. Sit in the gentle breeze for a while. And dont fear to explore, think good...
    6. Give THANKS to THE MOST HIGH, THE SUSTAINER.
===================================
```

## ✨ Features

- 🎨 **Colour-coded output** using ANSI escape codes
- 📅 **Live date & time** via `date`, refreshed each run
- ✅ **Task list** read safely from `~/todo.md`
- 🛡️ **Graceful fallback** when `todo.md` is absent
- ⚡ **Zero dependencies** — pure Bash

## 📦 Requirements

- Bash 4.x or newer
- A Linux or WSL environment

## 🚀 Installation

> **Where to run these:** every command below is run from your **home terminal**.
> Lines starting with `~` work from *any* directory, so you don't need to `cd` anywhere
> special unless a step says so. After cloning, you'll `cd` into the project folder.

### Step 1 — Clone the repository

Run this from anywhere (it will create a `welcome-banner` folder in your current directory):

```bash
git clone https://github.com/<your-username>/welcome-banner.git
cd welcome-banner          # move INTO the project folder — later steps assume you are here
```

### Step 2 — Create the local bin directory (safely)

`~/.local/bin` is the standard place for personal commands. We create it only if it
doesn't already exist, so nothing you already have is touched:

```bash
# -p = create only if missing; never errors or overwrites an existing directory
mkdir -p ~/.local/bin
```

### Step 3 — Install the script (without overwriting an existing command)

Before copying, we check whether a command named `welcome` is already there — so we
never destroy a file you (or another program) put there earlier:

```bash
# Refuse to overwrite: if ~/.local/bin/welcome already exists, stop and warn.
if [ -e ~/.local/bin/welcome ]; then
    echo "⚠️  ~/.local/bin/welcome already exists — not overwriting. Remove it first if you want to reinstall."
else
    cp welcome.sh ~/.local/bin/welcome   # run from inside the project folder (Step 1)
    chmod +x ~/.local/bin/welcome        # make it executable
    echo "✅ Installed to ~/.local/bin/welcome"
fi
```

### Step 4 — Add `~/.local/bin` to your PATH

This lets you type just `welcome` from anywhere. Pick the block for **your** shell.

**bash** (default shell) — add the line only if it isn't already in `~/.bashrc`:

```bash
# The grep guard prevents adding a duplicate line if you run this twice.
grep -qxF 'export PATH="$HOME/.local/bin:$PATH"' ~/.bashrc \
    || echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc          # apply it to the current terminal right now
```

**fish** — run once (fish stores it permanently and skips duplicates itself):

```fish
fish_add_path ~/.local/bin
```

### Step 5 — Verify it worked

```bash
welcome          # should print the banner from any directory
```

If `welcome: command not found` appears, open a **new** terminal (so the updated PATH
loads) and try again.

## ⚙️ Usage

Run it manually from anywhere:

```bash
welcome
```

### Show the banner automatically on shell startup

**fish** — add to `~/.config/fish/config.fish`:

```fish
if status is-interactive
    welcome
end
```

**bash** — add to `~/.bashrc`:

```bash
welcome
```

## 🗂️ Task list

Create a `~/todo.md` file with one task per line:

```text
Finish bash step 5
Push welcome.sh to git
```

If the file is missing, the banner shows a friendly fallback instead of an error.

## 🤝 Contributing

Contributions are welcome. Please open an issue to discuss a change before submitting a pull request.

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.