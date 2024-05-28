#/usr/bin/bash
sleep 2
  if [ ! -f "frida-server" ]; then
    wget https://github.com/frida/frida/releases/download/16.1.11/frida-server-16.1.11-android-x86_64.xz
    unxz frida-server-16.1.11-android-x86_64.xz
    mv frida-server-16.1.11-android-x86_64 frida-server
    echo "frida-server installed"
  else
    echo "frida-server already exists"
  fi

sleep 1
adb root
sleep  2
adb push frida-server /data/local/tmp/
sleep 2
adb shell chmod +x  /data/local/tmp/frida-server
adb shell /data/local/tmp/frida-server &
sleep 2
adb start com.android.chrome
sleep 2
adb shell am force-stop com.android.chrome
sleep 1
adb shell am start -a android.intent.action.VIEW -d https://bitmovin.com/demos/drm
python3 dump_keys.py --cdm-version '16.1.0'
