#!/data/data/com.termux/files/usr/bin/env bash
termux-wake-lock

pkg i python inotify-tools jq cronie -y && pip install -U pyrogram tgcrypto && pkg clean && pkg autoclean

~/ipcamgram/tgsend.sh "me" ~/ipcamgram/README.md "authorization successful"
