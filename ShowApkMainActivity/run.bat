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
echo ***************Show PkgName and MainActivity*******************
echo **                                                           **
echo ** 这个工具会查找APK的PackageName和MainActivity              **
echo ** 对第三方应用比较有用。                                    **
echo **                                                           **
echo ***************************************************************
echo.
:setApk
set /p ApkName=Please input the full path of apk,eg: c:/unsigned-apk.apk :
rem 逻辑分支判断(/i参数表示勿略大小写)
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