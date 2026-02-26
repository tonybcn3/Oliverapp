@echo off
echo 🚀 REPARANDO PANTALLA BLANCA - Oliverapp v1.0.5...

:: 1. Limpieza total
taskkill /F /IM dart.exe /T >nul 2>&1
call flutter.bat clean
call flutter.bat pub get

:: 2. Construcción con la ruta exacta de tu GitHub
echo 🛠️ Generando archivos para: https://tonybcn3.github.io/Oliverapp/
:: Usamos --base-href con el nombre exacto de tu carpeta en GitHub
call flutter.bat build web --release --base-href "/Oliverapp/" --web-renderer html --pwa-strategy=none

:: 3. Mover archivos (Limpiando el index.html previo)
echo 📂 Moviendo archivos nuevos a la raiz...
if exist index.html del /f /q index.html
copy /y "build\web\index.html" "index.html"
xcopy "build\web\*" "." /s /e /y /h /i

:: 4. Subir a GitHub
echo 📤 Subiendo correccion de ruta...
git add --all
git commit -m "Fix: correccion de base-href para evitar pantalla blanca"
git push origin master

echo.
echo ✅ ¡LISTO! Espera 2 minutos al check verde en GitHub.
echo Luego recarga: https://tonybcn3.github.io/Oliverapp/
pause