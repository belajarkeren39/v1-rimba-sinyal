@echo off
setlocal
cd /d "%~dp0"
set "RIMBA_NODE=node"
where node >nul 2>nul
if errorlevel 1 (
  set "RIMBA_NODE=%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe"
  if not exist "%USERPROFILE%\.cache\codex-runtimes\codex-primary-runtime\dependencies\node\bin\node.exe" (
    echo Node.js belum tersedia. Untuk bermain tanpa kamera, buka index.html
    echo lalu pilih kontrol Tombol. Petunjuk kamera ada di PANDUAN.md.
    pause
    exit /b 1
  )
)
echo Membuka Rimba Sinyal. Biarkan jendela ini terbuka selama bermain.
set "RIMBA_OPEN=1"
"%RIMBA_NODE%" server.cjs
pause
