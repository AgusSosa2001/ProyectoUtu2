@echo off
cls
set posicion=%cd%
color a
echo ::::::::::::::::::::::::::::::::::::::
echo ::Sesion iniciada como Administrador::
echo ::::::::::::::::::::::::::::::::::::::
timeout 2 /nobreak > nul
cls
echo Desea gestionar propiedades o Usuarios?
echo P- Propiedades
echo U- Usuarios
timeout 2 > nul
choice /c PU /m "P para gestionar propiedades y "U" para gestionar usuarios.
cls
if %errorlevel% equ 1 goto 1
if %errorlevel% equ 2 goto 2

:1
echo estas gestionando las propiedades
goto end

:2
cd proyecto
cd Usuarios
echo Desea gestionar Administradores, Agentes, Clientes o Pendientes?
timeout 1 /nobreak > nul
choice /c ACMP /m "A para gestionar agentes, C para gestionar clientes, M para gestionar administradores y P para pendientes
if %errorlevel% equ 1 goto A
if %errorlevel% equ 2 goto C
if %errorlevel% equ 3 goto M
if %errorlevel% equ 4 goto P

:A
cd Agentes
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando agentes
goto end

:C
cd Clientes
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando usuarios
goto end

:M
cd Administradores
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando Administradores
goto end

:P
cd pendientes
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando los usuarios Pendientes
timeout 2 /nobreak > nul

goto end

:end
cd %proyecto%