@echo off
cls
rem ���ô������߶ȺͿ��
mode con: cols=65 lines=30
rem ���ñ���ǰ��ɫ����������ʾ���ݱ�����ʾ����
color 0A

@echo off
:help
cls
echo ***************************************************************
echo ******************Android APK resign tool**********************
echo **                                                           **
echo ** ������߻Ὣ������app������ǩ����ǩ��ʹ�õ�key�����е���  **
echo ** �ϵ�debug.keystore,key��Ĭ�ϱ���·���ǣ�                  **
echo **                                                           **
echo ** [����û��ռ�]/.android/debug.keystore                    **
echo **                                                           **
echo ** ���գ����ɵ���ǩ����apk�����ڵ���Ŀ¼�£��ļ���Ϊ         **
echo **     resign-ok-debug.apk                                   **
echo **                                                           **
echo ** Attention: ����ǩ����apk��Ҫ��ɾ��META-INF�ļ���          **
echo **                                                           **
echo ***************************************************************
echo Your DebugKey: %userprofile%/.android/debug.keystore
:setApk
set /p ApkName=Please input the full path of apk,eg: c:/unsigned-apk.apk :
rem �߼���֧�ж�(/i������ʾ���Դ�Сд)
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
