@echo off
setlocal EnableDelayedExpansion

REM === Lấy public_url từ ngrok API bằng PowerShell ===
for /f "usebackq tokens=*" %%i in (`powershell -Command "(Invoke-RestMethod http://127.0.0.1:4040/api/tunnels).tunnels[0].public_url"`) do (
    set "CLEAN_URL=%%i"
    goto found
)

:found
if not defined CLEAN_URL (
    echo [ERROR] Không tìm thấy public_url từ ngrok. Hãy đảm bảo ngrok đang chạy.
    pause
    exit /b
)

REM === Đường dẫn tới thư mục resources ===
set "CONFIG_PATH=%~dp0src\main\resources"
echo [DEBUG] CONFIG_PATH = !CONFIG_PATH!

REM === Tạo thư mục nếu chưa tồn tại (an toàn) ===
if not exist "!CONFIG_PATH!" (
    echo [INFO] Creating folder...
    mkdir "!CONFIG_PATH!"
)

REM === Tạo redirect URI ===
set "REDIRECT_URI=!CLEAN_URL!/tqh/facebook-callback"

REM === Ghi redirect URI vào file oauth.properties ===
echo REDIRECT_URI=!REDIRECT_URI! > "!CONFIG_PATH!\oauth.properties"

REM === In kết quả ra màn hình ===
echo [OK] Updated redirect URI:
echo !REDIRECT_URI!
pause
