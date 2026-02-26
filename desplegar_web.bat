@echo off
echo 🚀 INICIANDO DESPLIEGUE AUTOMATICO DE OLIVER APP...

:: 1. Limpieza y preparación
echo 🧹 Limpiando versiones antiguas...
call flutter clean
call flutter pub get

:: 2. Construcción de la versión Web
echo 🛠️ Generando nuevos archivos web (Canvaskit)...
call flutter build web --release --web-renderer canvaskit --pwa-strategy=none

:: 3. Mover archivos de build/web a la raiz
echo 📂 Moviendo archivos a la raiz del repositorio...
xcopy /s /e /y build\web\* .

:: 4. Subir todo a GitHub (CAMBIA EL TEXTO ENTRE COMILLAS CUANDO QUIERAS)
echo 📤 Subiendo cambios a GitHub Master...
git add .
git commit -m "Actualizacion 1.0.5: Mejora de zoom y scroll fluido"
git push origin master

echo.
echo ✅ ¡PROCESO FINALIZADO CON EXITO!
echo Tu web se esta actualizando.
pause