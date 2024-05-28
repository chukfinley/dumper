#/usr/bin/bash
sleep 5
adb root
sleep  2
adb push frida-server /data/local/tmp/
sleep 2
adb shell chmod +x  /data/local/tmp/frida-server
adb shell /data/local/tmp/frida-server &
sleep 2
python3 dump_keys.py --cdm-version '16.1.0'