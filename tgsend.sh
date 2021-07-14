#!/data/data/com.termux/files/usr/bin/env python
import os, sys, glob
from pyrogram import Client

api_id = 
api_hash = ""

with Client("my_account", api_id, api_hash) as app:    
    for name in sorted(glob.glob(sys.argv[2])):        
        app.send_document(sys.argv[1], name, caption=sys.argv[3])
        print(name + " <<<--- Загружен.")
        os.remove(name)
        print(name + " <<<--- Удален.")

