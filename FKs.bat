@echo off
chcp 936
setlocal EnableDelayedExpansion

color B

:menu
chcp 936
cls
echo 请选择一个选项：(v2025.2.16)  — 方块私服脚本
echo.
echo.
echo 1. 添加私服
echo.
echo 2. 修复旧版游戏打开黑屏
echo.
echo 3. 更新脚本
echo.
echo 4. 更新脚本(备用)
echo.
echo ---------- 退出 ----------
echo.
echo 0. 退出脚本
echo.
echo 声明：本脚本仅限本群私用，禁止非授权者使用！
echo.
echo 必要时请找方块授权
echo.
set /p choice=选择一个选项(数字)，回车确认：
if "%choice%"=="1" goto server-menu
if "%choice%"=="2" goto DelAppData
if "%choice%"=="3" goto Update
if "%choice%"=="4" goto Update2
if "%choice%"=="0" goto OUT

:server-menu
cls
echo 请选择一个选项：
echo.
echo.
echo 1. 添加本群方块私服【优先选择】
echo.
echo 2. 添加Niko服和MAS等私服
echo.
echo 3. 添加猫服和方块私服
echo.
echo 4. 删除私服
echo.
echo 0. 返回
echo.
echo 注意：
echo.
echo 添加私服时如果出现红色报错请向群友反馈
echo Windows 7 暂时无法使用脚本！（正在优化）
echo.
set /p choice=选择一个选项(数字)，回车确认：
if "%choice%"=="1" goto ALL
if "%choice%"=="2" goto Other
if "%choice%"=="3" goto Total
if "%choice%"=="4" goto DelServer
if "%choice%"=="0" goto menu

:ALL
cls
echo 正在添加私服，请稍等...
echo.
echo 私服文件路径：%Appdata%\..\LocalLow\Innersloth\Among Us\regionInfo.json
echo.
curl "https://dl.fangkuai.fun/ServerFiles/sf-fk.json" -o "%Appdata%\..\LocalLow\Innersloth\Among Us\regionInfo.json"
IF %ERRORLEVEL% NEQ 0 (
    echo 下载失败
    pause
    goto server-menu
)
echo.
echo 添加完成！按任何按键即可退出。
echo.
pause
goto end

:Other
cls
echo 正在添加私服，请稍等...
echo.
echo 私服文件路径：%Appdata%\..\LocalLow\Innersloth\Among Us\regionInfo.json
echo.
curl "https://dl.fangkuai.fun/ServerFiles/sf-more.json" -o "%Appdata%\..\LocalLow\Innersloth\Among Us\regionInfo.json"
IF %ERRORLEVEL% NEQ 0 (
    echo 下载失败
    pause
    goto server-menu
)
echo.
echo 添加完成！按任何按键即可退出。
echo.
pause
goto end

:Total
cls
echo 正在添加私服，请稍等...
echo.
echo 私服文件路径：%Appdata%\..\LocalLow\Innersloth\Among Us\regionInfo.json
echo.
curl "https://dl.fangkuai.fun/ServerFiles/sf-total.json" -o "%Appdata%\..\LocalLow\Innersloth\Among Us\regionInfo.json"
IF %ERRORLEVEL% NEQ 0 (
    echo 下载失败
    pause
    goto server-menu
)
echo.
echo 添加完成！按任何按键即可退出。
echo.
pause
goto end

:DelServer
cls
echo 正在删除私服文件 "regionInfo.json" ，请稍等...
del "%Appdata%\..\LocalLow\Innersloth\Among Us\regionInfo.json"
IF %ERRORLEVEL% NEQ 0 (
    echo 删除失败
    pause
    goto server-menu
)
echo 删除完成！
pause
goto end

:DelAppData
cls
echo.
echo.
echo 正在下载旧版本游戏预设
echo.
echo 确定请按回车
timeout /T -1
cls
echo 正在下载  settings.amogus  请稍等...
echo.
curl "https://dl.fangkuai.fun/ServerFiles/settings.amongus" -o "%Appdata%\..\LocalLow\Innersloth\Among Us\settings.amogus"
IF %ERRORLEVEL% NEQ 0 (
    echo 下载失败
    pause
    goto menu
)
echo.
pause
goto end

:Update
cls
set "batchPath=%~f0"
set "newBatchName=update.temp.bat"
set "newBatchPath=%TEMP%\%newBatchName%"
echo 当前目录为%~dp0% 
echo.
echo 正在自动更新脚本...请稍后...
echo.
timeout /T 1
echo.
cls
echo 正在自动更新脚本...请稍后...（2024）
echo.
echo 正在从服务器 "fangkuai.fun" 下载脚本 %newBatchName% 到 %TEMP%\%newBatchName%
echo.
curl https://dl.fangkuai.fun/ServerFiles/update.bat -o "%newBatchPath%"
IF %ERRORLEVEL% NEQ 0 (
    echo 自动更新失败
    pause
    goto menu
)
echo.
echo 替换新脚本...
echo.
timeout /T 1
cls
move /y "%newBatchPath%" "%batchPath%" && goto menu

:Update2
cls
set "batchPath=%~f0"
set "newBatchName=update.temp.bat"
set "newBatchPath=%TEMP%\%newBatchName%"
echo 当前目录为%~dp0% 
echo.
echo 正在自动更新脚本...请稍后...
echo.
timeout /T 1
echo.
cls
echo 正在自动更新脚本...请稍后...（2024）
echo.
echo 正在从服务器 "fangkuai.fun" 下载脚本 %newBatchName% 到 %TEMP%\%newBatchName%
echo.
curl http://154.37.215.170:2222/ServerFiles/update.bat -o "%newBatchPath%"
IF %ERRORLEVEL% NEQ 0 (
    echo 自动更新失败
    pause
    goto menu
)
echo.
echo 替换新脚本...
echo.
timeout /T 1
cls
move /y "%newBatchPath%" "%batchPath%" && goto menu

:end
cls
echo 是否继续？
echo.
echo.
echo 1. 返回菜单
echo.
echo 0. 退出脚本
echo.
echo.
set /p choice=选择一个选项(数字) , 回车确认：
if "%choice%"=="1" goto menu
if "%choice%"=="2" goto OUT
if "%choice%"=="0" goto OUT

:OUT