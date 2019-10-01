@echo off
cls
set posicion= %cd%
set usr=0
if not exist %posicion%\proyecto\Usuarios\Baja_Logica (
md %posicion%\proyecto\Usuarios\Baja_Lógica
)
color a
echo :::::::::::::::::::::::::::::::
echo ::Sesion iniciada como Agente::
echo :::::::::::::::::::::::::::::::
timeout 2 /nobreak > nul


:Menu
cls
echo como agente puede: Gestionar clientes y Listar las propiedades 
choice /c CLI /m "C para gestionar los clientes, L para listar las propiedades e I para volver al menu principal"
if %errorlevel% equ 1 goto ABML
if %errorlevel% equ 2 (
cls 
echo Lista de propiedades
cd %posicion%/proyecto/Sistemas/Propiedades
dir /b
pause
goto Menu
)
if %errorlevel% equ 3 call proyecto


:ABML
cd %posicion%/proyecto/Usuarios/Clientes
choice /c ABML /m "A para admitir el registro de clientes, B para dar de baja un cliente, M para modificarlo y L para listarlos"
if %errorlevel% equ 1 goto A
if %errorlevel% equ 2 goto B
if %errorlevel% equ 3 goto M
if %errorlevel% equ 4 (
cls
echo Lista de clientes
dir /b
pause
goto Menu
)


:A
cd %posicion%/proyecto/Usuarios/Pendientes
echo ::::::::::::::::::::::::::::::::::::::::::::
echo ::A cual de estos usuarios desea admitir? ::
echo ::::::::::::::::::::::::::::::::::::::::::::
echo.
dir /b
set /p usr= Usuario: 
if exist %usr% (
move "%usr%" "%posicion%/proyecto/Usuarios/Clientes"
goto Menu
) else (
color c
echo El usuario no existe en la lista
timeout 2 /nobreak
goto Menu
)

:B
cd %posicion%/proyecto/Usuarios/Clientes
choice /c FL /m "F para una baja fisica y L para una baja logica"
if %errorlevel% equ 1 goto fisica
if %errorlevel% equ 2 goto logica

:M



:fisica
del %posicion%\proyecto\Usuario\Agentes
rd %posicion%\proyecto\Usuario\Agentes
goto Menu

:logica
move "%posicion%\proyecto\Usuario\Clientes\%usr%" "%posicion%\proyecto\Usuario\Baja_Logica"
goto Menu


















