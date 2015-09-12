# ninedroidS2
This project is a Hack of the Ninedroid.apk android application (from Ninebot) to enable it to run on small screen devices such as Galaxy S2

USAGE: ./patch-build-install.bash    in a linux console  (Use a linux VM if you are under a proprietary OS)

The Ninebot One is a self balanced monocycle. See here: http://www.ninebot-france.com/gyroroue/ninebot-one/
It is very fun to ride.
The app provided is ninedroid.apk (for android systems) : http://www.ninebot.com/ninebot/APP/

Unfortunately the app is crashing on my Samsung Galaxy S2, which runs a Cyanogenmod version of Android. So I decided to hack it a bit,

This project is the result of my little hack:
- it allows the application to run on my GSII , with android 4.3.1 (Cyanogen 10.2) 
- It reduces the visual widgets so that the "Lock" button and the "Speed Limiter" are visible.
- All screens are now reduced by 80% compared to original App

Todo:
- Maybe complete transalation, where ninebot negligted to complete the task ...


It will :
- Download necessary tools
- Download the App  (ninedroid.apk) from Ninebot
- Decompile the application
- Apply a few Patches to it
- Rebuild the App
- Attempt to install it on you device, if connected throught "adb".


References:
I followed instruction from the french paper magazine Gnu Linux Magazine France No 184.  (GLMF 184)
Thus I use apktool.jar to decompile->patch->recompile, and I also use signapk.jar to ensure direct installation to my GS2.
        Infos here: http://ibotpeaches.github.io/Apktool/
	        and here: http://www.learn2crack.com/2014/02/sign-android-apk-zip.html


I hope this is usefull.
Don't hesitate to comment.

LGT2
