#!/data/data/com.termux/files/usr/bin/env bash
termux-wake-lock

pkg i termux-api python inotify-tools jq cronie -y && pip install -U pyrogram tgcrypto && pkg clean && pkg autoclean

! [ -d ~/.termux/boot/ ] && mkdir -p ~/.termux/boot/

cp ~/ipcamgram/boot-ip-webcam.sh ~/.termux/boot/

~/ipcamgram/tgsend.sh "me" ~/ipcamgram/README.md "authorization successful"
