@echo off
echo 🚀 DESPLIEGUE SEGURO v1.0.5...

:: 1. Limpieza
call flutter.bat clean
call flutter.bat pub get

:: 2. Construcción básica (Sin parámetros que den error)
echo 🛠️ Generando archivos...
call flutter.bat build web --base-href "/Oliverapp/"

:: 3. Mover archivos (Asegurando que la carpeta existe)
echo 📂 Moviendo archivos...
if exist build\web (
    copy /y "build\web\index.html" "index.html"
    xcopy "build\web\*" "." /s /e /y /h /i
) else (
    echo ❌ ERROR CRITICO: No se ha creado la carpeta build\web
)

:: 4. Subir a GitHub
echo 📤 Subiendo...
git add --all
git commit -m "VERSION 1.0.5 FINAL FUNCIONANDO"
git push origin master

echo.
echo ✅ PROCESO FINALIZADO.
pause