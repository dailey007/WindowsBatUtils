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
echo ***************Show PkgName and MainActivity*******************
echo **                                                           **
echo ** ������߻����APK��PackageName��MainActivity              **
echo ** �Ե�����Ӧ�ñȽ����á�                                    **
echo **                                                           **
echo ***************************************************************
echo.
:setApk
set /p ApkName=Please input the full path of apk,eg: c:/unsigned-apk.apk :
rem �߼���֧�ж�(/i������ʾ���Դ�Сд)
if '%ApkName%'=='' (
echo.
goto setApk
)
echo.
@aapt dump badging %ApkName% | find "package:"
echo.
@aapt dump badging %ApkName% | find "launchable-activity"
echo.
echo.
pause