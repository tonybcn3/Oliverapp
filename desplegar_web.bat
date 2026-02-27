@echo off
echo 🚀 DESPLIEGUE MODO COMPATIBILIDAD (HTML) v1.0.5...

:: 1. Limpieza profunda
taskkill /F /IM dart.exe /T >nul 2>&1
call flutter.bat clean
call flutter.bat pub get

:: 2. Construcción con motor HTML (Mejor para imágenes muy largas)
echo 🛠️ Generando archivos con motor HTML...
call flutter.bat build web --release --base-href "/Oliverapp/" --web-renderer html --pwa-strategy=none

:: 3. Mover archivos a la raiz
echo 📂 Moviendo archivos...
if exist build\web (
    if exist index.html del /f /q index.html
    copy /y "build\web\index.html" "index.html"
    xcopy "build\web\*" "." /s /e /y /h /i
) else (
    echo ❌ ERROR CRITICO: No se ha creado la carpeta build\web
)

:: 4. Subir a GitHub
echo 📤 Subiendo cambios a GitHub...
git add --all
git commit -m "VERSION 1.0.5 - Motor HTML para imagenes largas"
git push origin master

echo.
echo ✅ PROCESO FINALIZADO.
echo Espera al check verde y prueba en Incógnito.
pause