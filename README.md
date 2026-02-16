# OpenClaw Total Wipeout

This is the “I want it gone” kit.

If OpenClaw is stuck, broken, haunting your machine, or you don’t even remember installing it, this repo removes it completely — Windows, WSL, configs, caches, everything.

No technical knowledge required.

------------------------------------------------------------
WHO THIS IS FOR
------------------------------------------------------------

• You installed OpenClaw and now regret it.
• You tried uninstalling it and it still shows up.
• You don’t know what you did and just want your computer back.

------------------------------------------------------------
WHAT THIS DOES (IN PLAIN ENGLISH)
------------------------------------------------------------

OpenClaw hides in multiple places:

• Inside WSL/Linux
• Inside Windows
• In leftover folders normal uninstallers ignore

These scripts:

• Stop anything OpenClaw might still be running
• Remove it from Windows
• Remove it from WSL
• Delete leftover junk
• Verify it’s actually gone

------------------------------------------------------------
STEP 1 — DOWNLOAD THIS REPO
------------------------------------------------------------

1. Click the green “Code” button.
2. Click “Download ZIP”.
3. Unzip it somewhere easy, like your Desktop.

------------------------------------------------------------
STEP 2 — WIPE OPENCLAW FROM WSL (LINUX)
------------------------------------------------------------

Skip this if you never used “Ubuntu” or “WSL”.

Open Ubuntu, then run:

cd /mnt/c/Users/YOUR-NAME/Desktop/openclaw-total-wipeout/scripts
chmod +x wipe-openclaw-wsl.sh
./wipe-openclaw-wsl.sh

------------------------------------------------------------
STEP 3 — WIPE OPENCLAW FROM WINDOWS
------------------------------------------------------------

Open PowerShell as Administrator, then run:

cd "$env:USERPROFILE\Desktop\openclaw-total-wipeout\scripts"
Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
./wipe-openclaw-windows.ps1

------------------------------------------------------------
STEP 4 — VERIFY IT’S GONE
------------------------------------------------------------

WSL:

cd /mnt/c/Users/YOUR-NAME/Desktop/openclaw-total-wipeout/scripts
chmod +x verify-openclaw-gone-wsl.sh
./verify-openclaw-gone-wsl.sh

Windows:

cd "$env:USERPROFILE\Desktop\openclaw-total-wipeout\scripts"
./verify-openclaw-gone-windows.ps1

------------------------------------------------------------
FAQ
------------------------------------------------------------

Q: Can this break other stuff?
A: No — it only targets OpenClaw and its folders.

Q: Can I reinstall OpenClaw later?
A: Yes. This just wipes it clean.

Q: Why didn’t uninstalling it normally work?
A: Because OpenClaw leaves behind services, folders, and PATH entries.

Q: Something still looks weird.
A: Open an issue and paste what you see. We’ll extend the scripts.

------------------------------------------------------------
NEED HELP?
------------------------------------------------------------

Open an issue with:
• What you ran
• What you saw
• Screenshot if possible
