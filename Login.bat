@echo off
color d
set contador=0
set tiempo=60
cls
color a
:Menu
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
if %opc3% equ 4 call Registro.bat 
if %opc3% neq 1 (
if %opc3% neq 2 (
if %opc3% neq 3 (
if %opc3% neq 4 (
goto fin
)
)
)
)
cls

::Login

:login
echo ::::::::::::::::::::::::::::::::::::::
echo ::Login                             ::
echo ::::::::::::::::::::::::::::::::::::::
echo.
set /p usuario= Usuario: 
if not exist %usuario% (
goto error 
) else (
cd %usuario%
)
cls
echo ::::::::::::::::::::::::::::::::::::::
echo ::Login                             ::
echo ::::::::::::::::::::::::::::::::::::::
echo.
set /p contra= Contrasenia: 
findstr /c:"Contrasenia: %contra%" %usuario%.txt
if %errorlevel% equ 1 goto error
if %errorlevel% equ 0 (
color a
timeout 2 /nobreak > nul 
echo Has ingresado correctamente
cd..
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
	cd..
	goto login
	) else (
	echo Has excedido los 5 intentos, espera %tiempo% segundos para continuar
	set /a tiempo=%tiempo%+60
	timeout %tiempo% /nobreak
	cd..
	goto login
	)


:fin
	cd..
	cd..
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
	echo opcion invalida
	timeout 3 /nobreak > nul
	goto Menu