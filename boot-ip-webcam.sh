#!/data/data/com.termux/files/usr/bin/env bash

. ~/ipcamgram/ipcamgram-config

######### Termux boot #############

termux-wake-lock
termux-wifi-enable true
sleep 40
sshd
crond

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

find $IP_WEBCAM_DIR -type f -iname "*.$FORMAT" -not -path "$VIDEO_DIR/*" -exec mv {} $VIDEO_DIR \;

###################################

(inotifywait -e close_write --format '%w%f' -m -q -r $IP_WEBCAM_DIR |\
(
while read
do
    ((var++))
    if [ $var -eq 2 ]
    then
        echo "Перемещаю $REPLY"
        mv -f $REPLY $VIDEO_DIR/
        var=0
    fi
done
)) &

########### Start #################

sleep 2
curl -u $LOGIN:$PASSWORD "$URL/startvideo?force=1&mode=$MODE&tag=$TAG_NAME" 
sleep 2
STATUS=$(curl -u $LOGIN:$PASSWORD "$URL/videostatus" | jq --raw-output ".fname") && bot_message "$STATUS запись"

###################################
