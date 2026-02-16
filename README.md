<h1 align="center">☠ OPENCLAW TOTAL WIPEOUT ☠</h1>
<h2 align="center">The Exorcism Kit for Your Haunted PC</h2>


   <p align="center">
  <img src="https://github.com/user-attachments/assets/a3bc5b10-3f2d-4687-ba37-f1ad97251524" alt="Image">
</p>


<div align="center">

<pre>
════════════════════════════════════════════════════

>> entity detected: OPENCLAW
>> threat level: POSSESSIVE EX
>> initiating full system exorcism...

[████████████████████████████] 100%

✔ infestation purged
✔ remnants burned
✔ spirit banished
✔ machine cleansed

STATUS: YOUR PC IS YOURS AGAIN

════════════════════════════════════════════════════
</pre>

<br>

<pre>
==========================================
        OPENCLAW : TOTAL WIPEOUT
     SYSTEM EXORCISM IN PROGRESS
==========================================

[✔] entity detected
[✔] infestation purged
[✔] remnants burned
[✔] spirit banished

STATUS: MACHINE CLEANSED
</pre>

</div>



Ah, OpenClaw. That sneaky little AI that promised to be your best friend but turned into a clingy ex who won't leave your system. Installed it on a whim? Now it's squatting in your WSL, lurking in your Windows folders, and probably judging your browser history.

If you're here, you're already feeling like a fool for letting it in—don't worry, we've all been there.

This repo is your digital garlic and holy water: it banishes OpenClaw completely. No Ouija board required.

No tech wizardry needed. Just follow along, and we'll laugh about this later.

---

## Who This Is For (No Judgment Zone)

- You thought OpenClaw was "cool" and now it's more like "cool, how do I make it stop?"
- You uninstalled it three times, but it's still waving from Task Manager like “Miss me?”
- You're staring at your screen thinking, *what fresh hell is this?*

We’re not here to say *I told you so.*

We’re here to say:

**Let’s nuke it from orbit.**

---

## What This Does (In Plain, Sarcastic English)

OpenClaw doesn’t just install — it *infests*.

Hiding in WSL like a hermit crab.  
Burrowing into Windows like a tick.  
Leaving digital droppings uninstallers fear to tread.

These scripts are pest control:

- Halt background processes
- Evict it from Windows
- Banish it from WSL
- Delete configs, caches, leftovers
- Double-check it’s actually gone

It’s therapy for your PC.  
Minus the hourly rate.

---

# OpenClaw Total Wipeout

Cleanly remove OpenClaw from a Windows machine without touching unrelated files or nuking your own repo.

This repo provides:

- A **safe Windows wipe script** that only targets known OpenClaw debris
- A **launcher script** that works even with GitHub’s double-folder ZIP layout
- Clear, ASCII-only output suitable for any default Windows PowerShell environment

---

## ⚠️ Important safety notes

**This tool is designed to be destructive only toward OpenClaw artifacts.**

- It does **not** delete arbitrary folders based on name patterns
- It does **not** recurse your entire user profile
- It does **not** delete this repo folder
- It only removes **known OpenClaw locations** and shims

However:

- Always review the scripts before running them
- Always run from a **local, non-cloud-synced folder**

---

## ⚠️ Do not run from OneDrive / Dropbox / iCloud

Windows and cloud sync tools can block or interfere with PowerShell scripts in synced folders.

**Do not run this repo from:**

- OneDrive
- Dropbox
- iCloud
- Google Drive
- Any other cloud-synced location

Instead:

1. Download the ZIP from GitHub
2. Extract it to a local folder, for example:

   ```
   C:\Users\<you>\Desktop\openclaw-total-wipeout
   ```
3. Run all commands from that local folder

If you see errors about scripts not being digitally signed or execution policy being restricted, you are very likely in a cloud-synced or protected folder.

## Requirements
Windows 10 or later

PowerShell (Windows PowerShell 5.x or PowerShell 7+)

Optional: npm installed, if OpenClaw was installed globally via npm

---

## Step 1 — Download This Repo

1. Click the green **Code** button
2. Hit **Download ZIP**
3. Extract to Desktop  
   (Preferably not inside a folder named *Regrets*)

---

## Step 2 — Wipe OpenClaw from WSL

Skip if you’ve never used WSL or Ubuntu.

### 2.1 Open Ubuntu

Start → type **Ubuntu** → Enter

If it asks for a password, yes, it’s judging you.

### 2.2 Run the Wipe Script

```bash
cd "$(find /mnt/c -maxdepth 5 -type d -name 'openclaw-total-wipeout*' 2>/dev/null | head -n 1)/scripts"
bash wsl_wipe.sh
```

Let it run. Don’t interrupt the exorcism.

---

## Step 3 — Windows Cleanup

Open **PowerShell as Administrator (Press Start, type powershell, right click windows power shell, select ##Run as administrator**

# IMPORTANT: You MUST run the script from inside the folder where you unzipped the repo.

PowerShell starts in C:\Windows\system32 when run as Administrator.
You must navigate into the repo folder first.

Example:
```
cd "C:\Users\<YourUser>\Downloads\openclaw-total-wipeout-main"
```

Then Allow local scripts to run (once per user): 

In Powershell, paste this:
```
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
```

Run The Launcher (where run-windows-wipe.ps1 lives)

```
.\run-windows-wipe.ps1
```

This is the ONLY way PowerShell will run the script.

The script will automatically locate the repo anywhere on your C: drive and run the wipe.

Approve prompts. Trust the process.

## You should see output similar to:

```
[INFO] Locating repo root...
[INFO] Repo root resolved to:
  C:\Users\<you>\Desktop\openclaw-total-wipeout
[INFO] Using wipe script:
  C:\Users\<you>\Desktop\openclaw-total-wipeout\scripts\wipe-openclaw-windows.ps1

=== OpenClaw Windows Wipe ===

Wipe OpenClaw from Windows? (y/N):
```

Type Y and press enter
---

## Step 4 — Reboot

Yes. Actually reboot.

Not sleep.  
Not shutdown.  
Not “I’ll do it later.”

**Reboot.**

This seals the ritual.

---

## Verification

After reboot:

- No OpenClaw processes
- No OpenClaw folders
- No WSL remnants
- No creepy background services

If you still see it:

Run the scripts again.  
We go scorched earth if necessary.

---

## Final Words

Your PC is yours again.

You survived.

Next time, read the install page before inviting demons into your kernel.

You’re welcome.
