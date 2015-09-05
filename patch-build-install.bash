#!/bin/bash
#
#  Pre-requisite :  adb , perl, java (1.7+ required for apktool)  should be in the path
#

echo ==========================
echo  Download App and tools 
echo ==========================
if [ ! -f Ninedroid.apk ]; then
	wget http://www.ninebot.cn/appdownload/app/Ninedroid.apk
fi

if [ ! -f tools/apktool.jar ]; then
	pushd tools
	wget http://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.0.1.jar -O apktool.jar
	popd tools
fi

if [ ! -f tools/signapk.jar ]; then
	pushd tools
	wget http://www.learn2crack.com/download/SignApk.zip -O SignApk.zip
	popd
fi

if [[ ! -f tools/signapk.jar && -f tools/SignApk.zip ]]; then
	pushd tools
	unzip -o SignApk.zip
	popd
fi
 
echo ==========================
echo Decompiling App
echo ==========================
java -jar tools/apktool.jar d -f Ninedroid.apk

echo ==========================
echo Patching App
echo ==========================
pushd Ninedroid
#find -type f -iname "*.xml" -print0 | xargs -0 -t -n 1 bash ../tools/reduc.bash
bash ../tools/reducjauges.bash res/layout/activity_item_nbgauge.xml
bash ../tools/allowstart.bash smali/cn/ninebot/ninedroid/BaseApplication.smali
popd

echo ==========================
echo rebuilding App
echo ==========================
java -jar tools/apktool.jar  b -f Ninedroid

echo ==========================
echo signing App
echo ==========================
pushd Ninedroid/dist
java -jar ../../tools/SignApk/signapk.jar ../../tools/certificate.pem ../../tools/key.pk8 ../../Ninedroid/dist/Ninedroid.apk ../../Ninedroid-Signed.apk
popd

echo ==========================
echo installing App on device
echo ==========================
adb install -r Ninedroid-Signed.apk
