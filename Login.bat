@echo off
color d
set contador=0
set tiempo=60
set opc3=0
set posicion= %cd%
cls
color a
:Menu
cd %posicion%
cd proyecto
cd Usuarios
echo ::::::::::::::::::::::::::::::::::::::
echo ::Login                             ::
echo ::::::::::::::::::::::::::::::::::::::
echo.
echo ::::::::::::::::::::::::::::::::::::::
echo ::Que tipo de usuario va a ingresar?::
echo ::::::::::::::::::::::::::::::::::::::
echo 1 - Administrador
echo 2 - Agente
echo 3 - Cliente
echo.
echo.
echo 4 - Ir al registro
set /p opc3=
timeout 2 /nobreak > nul
if %opc3% equ 1 (
cd Administradores
cls
goto login
)
if %opc3% equ 2 (
cd Agentes
cls
goto login
)
if %opc3% equ 3 (
cd Clientes
cls
goto login
) 
if %opc3% equ 4 (
	cd %posicion%
	call Registro.bat
	pause
)
if %opc3% neq 1 (
if %opc3% neq 2 (
if %opc3% neq 3 (
if %opc3% neq 4 (
cd %posicion%
goto Menu
)
)
)
)
cls
goto login

::Login
:login
echo ::::::::::::::::::::::::::::::::::::::
echo ::Login                             ::
echo ::::::::::::::::::::::::::::::::::::::
echo.
set /p ced= Usuario: 
if not exist %ced% (
goto error 
) else (
cd %ced%
)
cls
color a
echo ::::::::::::::::::::::::::::::::::::::
echo ::Login                             ::
echo ::::::::::::::::::::::::::::::::::::::
echo.
set /p contra= Contrasenia: 
findstr /c:"Contrasenia: %contra%" %ced%.txt
if %errorlevel% equ 1 goto error
if %errorlevel% equ 0 (
	cls
	color a
	timeout 1 /nobreak > nul 
	echo Has ingresado correctamente
	goto fin
)

:error
	color c
	cls
	echo El usuario y la contrasenia no coinciden o no estan registrados
	echo Intente nuevamente
	if %contador% lss 4 (
	set /a contador=%contador%+1
	timeout 2 /nobreak > nul
	goto login
	) else (
	echo Has excedido los 5 intentos, espera %tiempo% segundos para continuar
	set /a tiempo=%tiempo%+60
	timeout %tiempo% /nobreak
	goto login
	)


:fin
	cd %posicion%
	timeout 3 /nobreak
	if %opc3% equ 1 (
	call Admin
	)
	if %opc3% equ 2 (
	call Agente
	)
	if %opc3% equ 3 (
	call Cliente
	)
	if %opc3% neq 1 (
	if %opc3% neq 2 (
	if %opc3% neq 3 (
	if %opc3% neq 4 (
	echo Opcion invalida
	timeout 3 /nobreak > nul
	goto Menu