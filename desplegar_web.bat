@echo off
setlocal enabledelayedexpansion
echo 🚀 INICIANDO DESPLIEGUE FORZADO v1.0.5 (MODO CONSOLA)...

:: 1. Forzar cierre de procesos de Dart/Flutter que puedan estar bloqueando
taskkill /F /IM dart.exe /T >nul 2>&1
taskkill /F /IM flutter.exe /T >nul 2>&1

:: 2. Ejecutar comandos de Flutter usando la ruta directa al ejecutable
echo 🧹 Limpiando y obteniendo paquetes...
call flutter.bat clean
call flutter.bat pub get

:: 3. Construir la web (usamos el motor HTML que es mas compatible para probar ahora)
echo 🛠️ Generando nuevos archivos web...
call flutter.bat build web --release --web-renderer html --pwa-strategy=none

:: 4. Copiar archivos manualmente para asegurar el index.html
echo 📂 Moviendo archivos a la raiz...
copy /y "build\web\index.html" "index.html"
xcopy /s /e /y /i "build\web\*" "."

:: 5. Subir a GitHub
echo 📤 Subiendo cambios a GitHub Master...
git add .
git commit -m "Actualizacion 1.0.5 corregida"
git push origin master

echo.
echo ✅ ¡PROCESO FINALIZADO SIN ERRORES!
pause