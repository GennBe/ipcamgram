#!/data/data/com.termux/files/usr/bin/env bash

. ~/ipcamgram/ipcamgram-config

if [ $(ls $VIDEO_DIR | wc -l) -ge 1 ] && [ $NET_TEST -eq 0 ]
then
    bot_message "Выгружаю из $VIDEO_DIR"
    echo "Выгружаю из $VIDEO_DIR"
    ~/ipcamgram/tgsend.sh "$CHAT_ID" "$VIDEO_DIR/*" "$CAPTION"
    rm -rf $VIDEO_DIR/*
fi
