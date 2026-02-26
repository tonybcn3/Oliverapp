@echo off
echo 🚀 DESPLIEGUE MANUAL REPARADO v1.0.5...

:: 1. Limpieza
echo 🧹 Limpiando...
taskkill /F /IM dart.exe /T >nul 2>&1
call flutter.bat clean
call flutter.bat pub get

:: 2. Construcción (Comando simplificado para evitar errores de opción)
echo 🛠️ Generando archivos nuevos...
call flutter.bat build web --release

:: 3. COPIADO (Con comprobación de existencia)
echo 📂 Moviendo archivos a la raiz...
if exist build\web (
    copy /y "build\web\index.html" "index.html"
    xcopy "build\web\*" "." /s /e /y /h /i
) else (
    echo ❌ ERROR: La carpeta build\web no se creo. Revisa el Modo Desarrollador.
)

:: 4. SUBIDA A GITHUB
echo 📤 Subiendo a GitHub...
git add --all
git commit -m "VERSION 1.0.5 - CORRECCION FINAL"
git push origin master

echo.
echo ✅ PROCESO FINALIZADO.
pause