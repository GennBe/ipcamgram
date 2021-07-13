# IpCamGram for Termux
Ip webcam video upload to Telegram and notifications in Telegram bot

## Installing
- Install app [Termux](https://f-droid.org/packages/com.termux/) [Termux:API](https://f-droid.org/packages/com.termux.api/) [Termux:Boot](https://f-droid.org/packages/com.termux.boot/)
``` bash
pkg upgrade -y && pkg i git -y && cd && git clone https://github.com/GennBe/ipcamgram.git && cd ipcamgram && chmod +x *.sh
```
- Get your own Telegram API key from https://my.telegram.org/apps
- Open your best text editor `tgsend.sh` and replace the `api_id` and `api_hash` values with your own.
- Save changes to `tgsend.sh`
- Run the script `~/ipcamgram/install.sh`
- Follow the instructions on your terminal to login.
- Watch Pyrogram send a message to yourself.
- Add `video-unload.sh` to crontab: *depends on `$VIDEO_TIME` in `ipcamgram-config` file +2 minutes!*
### Example
- `$VIDEO_TIME="30"`
- Enter the command:
`crontab -e`
- And add `*/32 * * * * ~/ipcamgram/video-unload.sh &> /dev/null`


## Requirements

- [Pyrogram](https://github.com/pyrogram/pyrogram)
