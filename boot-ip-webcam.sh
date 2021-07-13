#!/data/data/com.termux/files/usr/bin/env bash

. ~/ipcamgram/ipcamgram-config

######### Termux boot #############

termux-wake-lock
termux-wifi-enable true
sleep 40

###################################

########### Start #################

bot_message "Ip Webcam start"
sleep 2
curl -u $LOGIN:$PASSWORD "$URL/settings/video_chunk_len?set=$VIDEO_TIME" && bot_message "Длительность:$VIDEO_TIMEмин"
sleep 2
curl -u $LOGIN:$PASSWORD "$URL/settings/video_size?set=$VIDEO_SIZE" && bot_message "Расширение:$VIDEO_SIZE"
sleep 2
curl -u $LOGIN:$PASSWORD "$URL/settings/quality?set=$QUALITY" && bot_message "Качество:$QUALITY%"
sleep 2
curl -u $LOGIN:$PASSWORD "$URL/focus" && bot_message "Фокус:ок"
sleep 2
curl -u $LOGIN:$PASSWORD "$URL/settings/mirror_flip?set=mirror,flip" && bot_message "Ориентация:ок"
sleep 2
curl -u $LOGIN:$PASSWORD "$URL/stopvideo?force=1" &> /dev/null
sleep 2
bot_message "$MY_IP"

find $IP_WEBCAM_DIR -type f -iname "*" -not -path "$DOWN_DIR/*" -exec mv {} $DOWN_DIR \;

###################################

(inotifywait -e close_write --format '%w%f' -m -q -r $IP_WEBCAM_DIR |\
(
while read
do
    ((var++))
    if [ $var -eq 2 ]
    then
        if [ $NET_TEST -eq 0 ]
        then
            bot_message "Выгружаю $REPLY"
            echo "Выгружаю из $REPLY"
            (~/ipcamgram/tgsend.sh $CHAT_ID $REPLY $CAPTION && rm -f $REPLY) &
        else
            echo "Нет доступа к Telegram"
            mv -f $REPLY $DOWN_DIR/
            NO_NET="1"
        fi
    var=0
    elif [ $(ls $DOWN_DIR | wc -l) -ge 1 ] && [ $NET_TEST -eq 0 ] && [ $NO_NET -eq 1 ]
    then
        echo "Выгружаю из $DOWN_DIR"
        bot_message "Выгружаю $DOWN_DIR"
        (~/ipcamgram/tgsend.sh $CHAT_ID $DOWN_DIR/"*" $CAPTION && rm -rf $DOWN_DIR/*) &
        NO_NET="0"
    fi
done
)) &

########### Start #################

sleep 2
curl -u $LOGIN:$PASSWORD "$URL/startvideo?force=1&mode=$MODE&tag=$VIDEO_NAME" 
sleep 2
STATUS=$(curl -u $LOGIN:$PASSWORD "$URL/videostatus" | jq --raw-output ".fname") && bot_message "$STATUS запись"

###################################
