@echo off
REM Script para subir proyecto a GitHub en Windows
REM Uso: upload.bat tu_username

setlocal enabledelayedexpansion

set USERNAME=Wilrey1106
set REPO_NAME=packet-tracer-vlan-trunking

cls
echo.
echo 🚀 Subiendo proyecto a GitHub (Wilrey1106)...
echo.

REM Verificar si git está instalado
git --version >nul 2>&1
if errorlevel 1 (
    echo ❌ Git no está instalado
    pause
    exit /b 1
)

REM Inicializar git
echo 📁 Inicializando repositorio...
git init
git config user.name "Student"
git config user.email "student@example.com"

REM Agregar archivos
echo 📄 Agregando archivos...
git add .
git commit -m "Agregar proyecto VLAN Trunking"

REM Cambiar a rama main
echo 🔄 Configurando rama...
git branch -M main

REM Configurar remote y push
echo 🌐 Conectando con GitHub...
git remote add origin "https://github.com/!USERNAME!/!REPO_NAME!.git"

echo.
echo ⬆️  Subiendo archivos...
echo.

git push -u origin main

if errorlevel 1 (
    echo.
    echo ❌ Error al subir. Verifica que:
    echo    1. El repositorio existe en GitHub (github.com/new)
    echo    2. Es PUBLIC
    echo    3. Tu username es correcto
    echo.
) else (
    echo.
    echo ✅ ¡Éxito! Tu proyecto está en:
    echo    https://github.com/!USERNAME!/!REPO_NAME!
    echo.
    echo 💡 Copia esto a tu CV:
    echo    github.com/!USERNAME!/!REPO_NAME!
    echo.
)

pause
