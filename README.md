# IpCamGram for Termux
Ip webcam video upload to Telegram and notifications in Telegram bot

## Installing

``` bash
pkg upgrade -y && pkg i git -y && cd && git clone https://github.com/GennBe/ipcamgram.git && cd ipcamgram && chmod +x *.sh
```
- Get your own Telegram API key from https://my.telegram.org/apps
- Open your best text editor ```tgsend.sh``` and replace the ```api_id``` and ```api_hash``` values with your own.
- Save changes to ```tgsend.sh```
- Run the script ```~/ipcamgram/install.sh```
- Follow the instructions on your terminal to login.
- Watch Pyrogram send a message to yourself.

## Requirements

- [Pyrogram](https://github.com/pyrogram/pyrogram)
