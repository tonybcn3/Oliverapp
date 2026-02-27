@echo off
echo 🚀 REINTENTANDO CONSTRUCCION LIMPIA...

:: 1. Limpieza
call flutter.bat clean
call flutter.bat pub get

:: 2. Construcción (Sin el comando que da error)
echo 🛠️ Generando archivos...
call flutter.bat build web --release --base-href "/Oliverapp/"

:: 3. Mover archivos (Solo si se han creado)
echo 📂 Moviendo archivos...
if exist build\web\index.html (
    if exist index.html del /f /q index.html
    copy /y "build\web\index.html" "index.html"
    xcopy "build\web\*" "." /s /e /y /h /i
) else (
    echo.
    echo ❌ ERROR: Flutter no ha generado la carpeta build\web.
    echo Revisa si hay errores arriba en el comando 'build web'.
    pause
    exit
)

:: 4. Subir a GitHub
echo 📤 Subiendo...
git add --all
git commit -m "VERSION 1.0.7 - Intento sin web-renderer"
git push origin master

echo.
echo ✅ PROCESO FINALIZADO.
pause