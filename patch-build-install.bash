#!/bin/bash
#
#  Pre-requisite :  adb , perl, java   should be in the path
#
if [ ! -f Ninedroid.apk ]; then
	echo "You should download Ninedroid.apk to this folder prior to patch it"
fi
 
java -jar tools/apktool.jar d -f Ninedroid.apk
pushd Ninedroid
#find -type f -iname "*.xml" -print0 | xargs -0 -t -n 1 bash ../tools/reduc.bash
bash ../tools/reducjauges.bash res/layout/activity_item_nbgauge.xml
bash ../tools/allowstart.bash smali/cn/ninebot/ninedroid/BaseApplication.smali
popd
java -jar tools/apktool.jar  b -f Ninedroid
pushd Ninedroid/dist
java -jar ../../tools/signapk.jar ../../tools/certificate.pem ../../tools/key.pk8 ../../Ninedroid/dist/Ninedroid.apk ../../Ninedroid-Signed.apk
popd
adb install -r Ninedroid-Signed.apk
