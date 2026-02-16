# OpenClaw Total Wipeout

This is the “I want it GONE” kit.

If OpenClaw is stuck, broken, haunting your machine, or you don’t even remember installing it, this repo removes it completely — Windows, WSL, configs, caches, everything.

No technical knowledge required.

---

## Who this is for

- You installed OpenClaw and now regret it.
- You tried uninstalling it and it still shows up.
- You don’t know what you did and just want your computer back.

---

## What this does (in plain English)

OpenClaw hides in multiple places:

- Inside WSL/Linux  
- Inside Windows  
- In leftover folders normal uninstallers ignore  

These scripts:

- Stop anything OpenClaw might still be running  
- Remove it from Windows  
- Remove it from WSL  
- Delete leftover junk  
- Verify it’s actually gone  

---

## Step 1 — Download this repo

1. Click the green **Code** button.
2. Click **Download ZIP**.
3. Unzip it somewhere easy, like your Desktop.

---

## Step 2 — Wipe OpenClaw from WSL (Linux)

Skip this if you never used “Ubuntu” or “WSL”.

### 2.1 Open Ubuntu (WSL)

Open Start → type **Ubuntu** → press Enter.

### 2.2 Run the wipe script

```bash
cd /mnt/c/Users/<YOUR-NAME>/Desktop/openclaw-total-wipeout/scripts
chmod +x wipe-openclaw-wsl.sh
./wipe-openclaw-wsl.sh
