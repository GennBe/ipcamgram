# IpCamGram for Termux
Ip webcam video auto upload to Telegram and notifications in Telegram bot. Cloud for video files.

## Installing
- Install app [IP Webcam](https://play.google.com/store/apps/details?id=com.pas.webcam) [Termux](https://f-droid.org/packages/com.termux/) [Termux:API](https://f-droid.org/packages/com.termux.api/) [Termux:Boot](https://f-droid.org/packages/com.termux.boot/)
- Go to Android settings and turn off battery optimizations for Termux and `Termux:Boot` applications.
- Start the `Termux:Boot` app once by clicking on its launcher icon. This allows the app to be run at boot.
- Start the `Termux` and run the command:
``` bash
pkg upgrade -y && pkg i git -y && cd && git clone https://github.com/GennBe/ipcamgram.git && cd ipcamgram && chmod +x *.sh
```
- Get your own Telegram API key from https://my.telegram.org/apps
- Open your best text editor `tgsend.sh` (`nano ~/ipcamgram/tgsend.sh`) and replace the `api_id` and `api_hash` values with your own.
- Save changes to `tgsend.sh`
- Run the script `~/ipcamgram/install.sh`
- Follow the instructions on your terminal to login.
- Watch Pyrogram send a message to yourself.

## Requirements

- [Pyrogram](https://github.com/pyrogram/pyrogram)
