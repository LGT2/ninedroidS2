# ninedroidS2
Hack of the ninedroid app (from Ninebot) to run on small screen devices such as Galaxy S2

The Ninebot One wheel belong to the monocycle category. It is very fun to ride.
Ninebot, the company which sells the wheel provide freely (but not open source) a piece of software to setup the wheel.

Unfortunately it is not running on my Samsung Galaxy S2, which runs a Cyanogenmod version of Android. So I decided to hack it a bit,

I followed instruction from the french paper magazine Gnu Linux Magazine France No 184.  (GLMF 184)
Thus I use apktool.jar to decompile->patch->recompile, and I also use signapk.jar to ensure direct installation to my GS2.

This project is the result of my little hack:
- it allows the application to run on my GSII , with android 4.3.1 (Cyanogen 10.2) 
- It reduces the visual widgets so that the "Lock" button and the "Speed Limiter" are visible.

Todo:
- Reduces the color selection screen, in order to see the whole 4 color choosers (instead of 2 only at the moment).



USAGE: ./ patch-build-install.bash    in a linux console  (Use a linux VM if you are under a proprietary OS)

It will :
- Download necessary tools
- Download the App  (ninedroid.apk) from Ninebot
- Decompile the application
- Apply a few Patches to it
- Rebuild the App
- Attempt to install it on you device, if connected throught "adb".


I hope this is usefull.
Don't hesitate to comment.

LGT2
