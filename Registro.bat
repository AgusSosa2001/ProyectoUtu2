	@echo off    
	color b
	cd proyecto
	cd Usuarios
	if not exist Pendientes (
	md Pendientes
	)
	cd Pendientes
	set contador=0
	set tiempo=60
	cls

:Nombre
	echo ::::::::::::
	echo ::REGISTRO::
	echo ::::::::::::
	echo.
	set /p rusuario= Nombre de usuario: 
	if exist %rusuario% (
		goto errornombre
	) else (
		md %rusuario%
		cd %rusuario%
		echo Nombre: %rusuario% > %rusuario%.txt
		cls
		color b
		goto Contra
	)

:Contra
	echo ::::::::::::
	echo ::REGISTRO::
	echo ::::::::::::
	echo.
	set /p rcontra= Contrasenia: 
	echo Contrasenia: %rcontra% >> %rusuario%.txt
	cls
	goto Correo

:Correo
	echo ::::::::::::
	echo ::REGISTRO::
	echo ::::::::::::
	echo.
	set /p rcorreo= Correo electronico: 
	echo Correo electronico: %rcorreo% >> %rusuario%.txt
	findstr "@" %rusuario%.txt
	if %errorlevel% equ 1 (
	goto errorcorreo
	)
	if %errorlevel% equ 0 (
	cls 
	goto fin
	)

::Errores
:errornombre
	color c
	cls
	echo El nombre de usuario ya existe
	echo Intente nuevamente
	if %contador% lss 4 (
	set /a contador=%contador%+1
	timeout 2 /nobreak > nul
	goto Nombre
	) else (
	echo Has excedido los 5 intentos, espera %tiempo% segundos para continuar
	set /a tiempo=%tiempo%+60
	timeout %tiempo% /nobreak
	goto Nombre
	)

:errorcorreo
	color c
	cls
	echo El correo no es valido
	echo Intente nuevamente
	if %contador% lss 4 (
	set /a contador=%contador%+1
	timeout 2 /nobreak > nul
	goto Correo
	) else (
	echo Has excedido los 5 intentos, espera %tiempo% segundos para continuar
	set /a tiempo=%tiempo%+60
	timeout %tiempo% /nobreak
	goto Correo
	)
	
::Fin	
:fin
	cd..
	cd..
	cd..
	cd..
	cls
	timeout 1 /nobreak > nul
	color a
	echo Espera un momento
	timeout 3 /nobreak
	call Proyecto.bat