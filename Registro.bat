	@echo off    
	color b
	set rced=0
	set rcontra=0
	set rcorreo=0
	set rusuario=0
	cd proyecto
	cd Usuarios
	if not exist Pendientes (
	md Pendientes
	)
	cd Pendientes
	set contador=0
	set tiempo=60
	cls

:Cedula
	echo ::::::::::::
	echo ::REGISTRO::
	echo ::::::::::::
	echo.
	echo Ingrese la cedula sin puntos ni guiones
	echo Ejemplo: 12345678
	set /p rced= Cedula: 
	if exist %rced% (
		goto errorcedula
	) else (
		md %rced%
	)
	cd %rced%
	echo Cedula: %rced% > %rced%.txt
	cls
	color b
	goto Nombre

:Nombre
	echo ::::::::::::
	echo ::REGISTRO::
	echo ::::::::::::
	echo.
	set /p rusuario= Nombre de usuario: 
		echo Nombre: %rusuario% >> %rced%.txt
		cls
		color b
		goto Contra

:Contra
	echo ::::::::::::
	echo ::REGISTRO::
	echo ::::::::::::
	echo.
	set /p rcontra= Contrasenia: 
	echo Contrasenia: %rcontra% >> %rced%.txt
	cls
	goto Correo

:Correo
	echo ::::::::::::
	echo ::REGISTRO::
	echo ::::::::::::
	echo.
	set /p rcorreo= Correo electronico: 
	echo Correo electronico: %rcorreo% >> %rced%.txt
	findstr "@" %rced%.txt
	if %errorlevel% equ 1 (
	goto errorcorreo
	)
	if %errorlevel% equ 0 (
	cls 
	color b
	goto fin
	)

::Errores
:errorcedula
	color c
	cls
	echo El usuario ya existe
	echo Intente nuevamente
	if %contador% lss 4 (
	set /a contador=%contador%+1
	timeout 2 /nobreak > nul
	goto Cedula
	) else (
	echo Has excedido los 5 intentos, espera %tiempo% segundos para continuar
	set /a tiempo=%tiempo%+60
	timeout %tiempo% /nobreak
	goto Cedula
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