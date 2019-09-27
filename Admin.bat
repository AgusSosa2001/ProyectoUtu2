@echo off
cls
color a
echo ::::::::::::::::::::::::::::::::::::::
echo ::Sesion iniciada como Administrador::
echo ::::::::::::::::::::::::::::::::::::::
timeout 1 > nul
cls
echo Desea gestionar propiedades o Usuarios?
echo 1- Propiedades
echo 2- Usuarios
timeout 2 > nul
cls

choice /c PU /m "P para gestionar propiedades y "U" para gestionar usuarios.
if %errorlevel% equ 1 goto 1
if %errorlevel% equ 2 goto 2
cls

:1
echo estas gestionando las propiedades
goto end

:2
echo Desea gestionar Agentes o clientes?
choice /c ACMP /m "A para gestionar agentes, C para gestionar clientes, M para gestionar administradores y P para pendientes
if %errorlevel% equ 1 goto A
if %errorlevel% equ 2 goto C
if %errorlevel% equ 3 goto M
if %errorlevel% equ 4 goto P

:A
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando agentes
goto end

:C
timeout 2 /nobreak > nul
cls
echo usted esta gestionando usuarios
goto end

:M
timeout 2 /nobreak > nul
cls
echo usted esta gestionando Administradores
goto end

:P
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando los usuarios pendientes


:end
pause

