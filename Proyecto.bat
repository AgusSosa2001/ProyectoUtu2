@echo off
color a
	::coso de carpetas
	if not exist proyecto (
	md proyecto
	)
	cd proyecto
	if not exist Usuarios (
	md Usuarios
	)
	if not exist Sistemas (
	md Sistemas
	)
	cd Sistemas
	if not exist Propiedades (
	md Propiedades
	)
	if not exist Clientes (
	md Clientes
	)
	if not exist Agentes (
	md Agentes
	)
	cd ..
	cd Usuarios
	if not exist Administradores (
	md Administradores
	)
	if not exist Agentes (
	md Agentes
	)
	if not exist Clientes (
	md Clientes
	)
	cd ..
	cd ..
	cls
	
	:Menu
	set opcion1= 0
	echo ::::::::::::::::::
	echo :Que desea hacer?:
	echo ::::::::::::::::::
	echo 1 - Ingreso
	echo 2 - Registro
	echo 3 - Irme alv
	set /p opcion1=
	
    ::Sistema de login
	if %opcion1% equ 1 (
    call Login.bat %opcion2%
	)
	::sistema de registro
	if %opcion1% equ 2 (
	call Registro.bat
	)
	::Irte alv
	if %opcion1% equ 3 (
	cls
	echo Gracias por utilizar el programa
	timeout 3 /nobreak > nul
	exit
	)
	::Si el usuario es pendejo
	if %opcion1% neq 1 (
	if %opcion1% neq 2 (
	if %opcion1% neq 3 (
	color c
	cls
	echo ------------------
	echo Intente nuevamente 
	echo ------------------
	timeout 3 /nobreak > nul
	goto Menu
	)
	)
	)