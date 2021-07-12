#!/data/data/com.termux/files/usr/bin/env bash

. ~/ipcamgram/ipcamgram-config

if [ $NET_TEST -eq 0 ]
then
    bot_message "Выгружаю из $VIDEO_DIR"
    echo "Выгружаю из $VIDEO_DIR"
    ~/ipcamgram/tgsend.sh "$CHAT_ID" "$VIDEO_DIR/*.$FORMAT" "$CAPTION"
    rm -rf $VIDEO_DIR/*
else
    echo "Нет доступа к Telegram"
fi
