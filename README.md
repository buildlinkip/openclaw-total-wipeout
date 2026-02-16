# OpenClaw Total Wipeout

You installed something called **OpenClaw**.

Now it’s weird, stuck, broken, or just **won’t go away**.

This repo is the **“make it disappear completely”** kit.

No jargon. No judgment. Just a clean kill.

---

## Who this is for

This is for you if:

- **You don’t remember how you installed OpenClaw.**
- **You tried uninstalling it and it STILL pops up.**
- **You just want your computer back the way it was.**

If you’re thinking:

> “I don’t even know what I did, I just followed some instructions.”

…this is for you.

---

## What this actually does (in plain language)

OpenClaw can hide in a few places:

- Inside **WSL / Linux** (the “fake Linux” inside Windows)
- Inside **Windows** itself
- In **little leftover folders and settings** that normal uninstall commands ignore

This repo:

- **Stops** anything OpenClaw might still be running
- **Removes** OpenClaw from where it was installed
- **Deletes** its leftover folders, logs, and junk
- **Checks** that it’s really gone

You’ll run a couple of scripts.  
They don’t “tune” or “fix” OpenClaw.  
They **erase it. Completely.**

---

## Before you start

**You should:**

- Be on **Windows** (this guide assumes that)
- Have **WSL** installed if you ever used OpenClaw in “Ubuntu” or “Linux” on your machine
- Be okay with **removing OpenClaw entirely**  
  (If you want to use it again later, you can reinstall it from scratch.)

---

## Step 1 — Download this repo

1. Go to this repo on GitHub.
2. Click the green **“Code”** button.
3. Click **“Download ZIP”**.
4. Unzip it somewhere easy, like your **Desktop**.

You should now have a folder called:

`openclaw-total-wipeout`

---

## Step 2 — Wipe OpenClaw from WSL (Linux side)

Do this **if you ever used OpenClaw inside Ubuntu/WSL**.

If you have no idea what that is, you can skip to Step 3.

### 2.1 Open Ubuntu (or your WSL Linux)

- Click **Start**
- Type **Ubuntu** (or whatever your WSL distro is called)
- Open it — a black terminal window should appear

### 2.2 Run the WSL wipe script

In that Ubuntu window:

1. Go to the folder where you unzipped this repo.  
   Example (adjust the path if needed):

   ```bash
   cd /mnt/c/Users/<YOUR-NAME>/Desktop/openclaw-total-wipeout/scripts
