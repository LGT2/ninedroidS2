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
	wget https://bitbucket.org/iBotPeaches/apktool/downloads/apktool_2.3.0.jar -O apktool.jar
	popd tools
fi

if [ ! -f tools/SignApk/signapk.jar ]; then
	pushd tools
	wget https://bit.ly/2cGAcIx -O SignApk.zip
	popd
fi

if [[ ! -f tools/SignApk/signapk.jar && -f tools/SignApk.zip ]]; then
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
mv res/values/styles.xml res/values/styles.excluded
mv res/values-v11/styles.xml res/values-v11/styles.excluded
find -type f -iname "*.xml" -print0  | xargs -0 -t -n 1 bash ../tools/reduc.bash
mv res/values/styles.excluded res/values/styles.xml
mv res/values-v11/styles.excluded res/values-v11/styles.xml
#bash ../tools/reduc.bash res/layout/activity_item_nbgauge.xml
#bash ../tools/reduc.bash res/layout/item_light_setting_one.xml
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
