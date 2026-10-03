@echo off
REM Usage: build.bat [path\to\aax-sdk]
if "%~1"=="" (set AAX=) else (set AAX=-DAAX_SDK_PATH=%~1)
cmake -B build -G "Visual Studio 17 2022" -A x64 %AAX% || exit /b 1
cmake --build build --config Release || exit /b 1
if "%~1"=="" (iscc installer\ChopShop.iss) else (iscc /DHasAAX installer\ChopShop.iss)
