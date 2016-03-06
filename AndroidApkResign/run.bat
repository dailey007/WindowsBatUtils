@echo off
cls
rem 设置窗体最大高度和宽度
mode con: cols=65 lines=30
rem 设置背景前景色，并设置显示窗休标题显示文字
color 0A

@echo off
:help
cls
echo ***************************************************************
echo ******************Android APK resign tool**********************
echo **                                                           **
echo ** 这个工具会将给定的app进行重签名，签名使用的key是运行电脑  **
echo ** 上的debug.keystore,key的默认保存路径是：                  **
echo **                                                           **
echo ** [你的用户空间]/.android/debug.keystore                    **
echo **                                                           **
echo ** 最终，生成的重签名的apk保存在当面目录下，文件名为         **
echo **     resign-ok-debug.apk                                   **
echo **                                                           **
echo ** Attention: 被重签名的apk需要先删掉META-INF文件夹          **
echo **                                                           **
echo ***************************************************************
echo Your DebugKey: %userprofile%/.android/debug.keystore
:setApk
set /p ApkName=Please input the full path of apk,eg: c:/unsigned-apk.apk :
rem 逻辑分支判断(/i参数表示勿略大小写)
if '%ApkName%'=='' (
echo.
goto setApk
)

set UnsignApkName=%ApkName%
set NewApk=resign-ok-debug.apk
del %NewApk%

::show signed apk
::%JAVA_HOME%/jarsigner -verify -verbose -certs %ApkName%

::rename apk to unsign.apk
::copy /y %ApkName% %UnsignApkName% 

::show unsigned apk
::jarsigner -verify -verbose -certs ./%UnsignApkName%

::resign apk
::jarsigner -digestalg SHA1 -sigalg MD5withRSA -keystore %userprofile%/.android/debug.keystore -storepass android -keypass android ./%UnsignApkName% androiddebugkey 
jarsigner -digestalg SHA1 -sigalg MD5withRSA -keystore %userprofile%/.android/debug.keystore -storepass android -keypass android %UnsignApkName% androiddebugkey 
::zipalign
@zipalign 4 %UnsignApkName% %NewApk%
echo.
echo Congratulations,resign apk successfully!!
echo.
pause
