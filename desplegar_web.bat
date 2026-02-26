@echo off
echo 🚀 DESPLIEGUE MANUAL FORZADO v1.0.5...

:: 1. Limpieza
echo 🧹 Limpiando procesos y carpetas...
taskkill /F /IM dart.exe /T >nul 2>&1
call flutter.bat clean
call flutter.bat pub get

:: 2. Construcción (Usando el modo mas compatible)
echo 🛠️ Generando archivos nuevos en build\web...
call flutter.bat build web --release --web-renderer html --pwa-strategy=none

:: 3. COPIADO MANUAL (Aqui es donde fallaba)
echo 📂 Copiando archivos de build\web a la raiz...
:: Forzamos el copiado del index.html especificamente
copy /y "build\web\index.html" "index.html"
:: Copiamos todo lo demas incluyendo carpetas
xcopy "build\web\*" "." /s /e /y /h /i

:: 4. SUBIDA A GITHUB
echo 📤 Subiendo todo a GitHub...
git add --all
git commit -m "VERSION 1.0.5"
git push origin master

echo.
echo ✅ PROCESO FINALIZADO.
echo Mira el mensaje de arriba: ^¿Ha dicho "X archivos copiados"^?
pause