#!/bin/bash

URL1="rtsp://admin:%21CuaAola08545qa@192.168.1.76/PSIA/Streaming/channels/1"
URL2="rtsp://admin:%21CuaAola08545qa@192.168.1.76/PSIA/Streaming/channels/2"

mpv --geometry=960x1080+0+0 --title="Cam 1" "$URL1" &
mpv --geometry=960x1080+960+0 --title="Cam 2" "$URL2" &
