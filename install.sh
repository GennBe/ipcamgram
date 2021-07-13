#!/data/data/com.termux/files/usr/bin/env bash
termux-wake-lock

echo "y" | termux-setup-storage

pkg i termux-api python inotify-tools jq -y && pip install -U pyrogram tgcrypto && pkg clean && pkg autoclean

! [ -d ~/.termux/boot ] && mkdir -p ~/.termux/boot && cp ~/ipcamgram/boot-ip-webcam.sh ~/.termux/boot/ && ! [ -d ~/storage/shared/ipwebcam_videos ] && mkdir -p ~/storage/shared/ipwebcam_videos

~/ipcamgram/tgsend.sh "me" ~/ipcamgram/README.md "authorization successful"
