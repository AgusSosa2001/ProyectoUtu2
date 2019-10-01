@echo off
cls
set posicion=%cd%
set ced2=0
set ced3=0
if not exist %posicion%\proyecto\Usuarios\Baja_Logica (
md %posicion%\proyecto\Usuarios\Baja_Lógica
)
color a
echo ::::::::::::::::::::::::::::::::::::::
echo ::Sesion iniciada como Administrador::
echo ::::::::::::::::::::::::::::::::::::::
timeout 2 /nobreak > nul
:Menu
cls
echo Desea gestionar propiedades o Usuarios?
echo P- Propiedades
echo U- Usuarios
timeout 1 > nul
choice /c PUI /m "P para gestionar propiedades, "U" para gestionar usuarios e "I" para irte alv.
cls
if %errorlevel% equ 1 goto 1
if %errorlevel% equ 2 goto 2
if %errorlevel% equ 3 goto end

:1
echo estas gestionando las propiedades
goto end

:2
cd proyecto
cd Usuarios
echo Desea gestionar Administradores, Agentes, Clientes o Pendientes?
timeout 1 /nobreak > nul
choice /c ACMP /m "A para gestionar agentes, C para gestionar clientes, M para gestionar administradores y P para pendientes"
if %errorlevel% equ 1 goto A
if %errorlevel% equ 2 goto C
if %errorlevel% equ 3 goto M
if %errorlevel% equ 4 goto P

:A
cd Agentes
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando agentes
timeout 2 /nobreak > nul
cls
echo :::::::::::::::::::::
echo ::Que desea hacer? ::
echo :::::::::::::::::::::
echo.
choice /c BML /m "B para dar de baja un usuario, M para modificarlo y L para listar los usuarios"
if %errorlevel% equ 1 goto bagente
if %errorlevel% equ 2 goto Modificar
if %errorlevel% equ 3 (
cls 
dir /b
pause
goto Menu
)

:C
cd Clientes
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando usuarios
timeout 2 /nobreak > nul
cls
echo :::::::::::::::::::::
echo ::Que desea hacer? ::
echo :::::::::::::::::::::
echo.
choice /c BML /m "B para dar de baja un usuario, M para modificarlo y L para listar los usuarios"
if %errorlevel% equ 1 goto busuario
if %errorlevel% equ 2 goto Modificar
if %errorlevel% equ 3 (
cls 
dir /b
pause
goto Menu
)

:M
cd Administradores
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando Administradores
timeout 2 /nobreak > nul
cls
echo :::::::::::::::::::::
echo ::Que desea hacer? ::
echo :::::::::::::::::::::
echo.
choice /c BML /m "B para dar de baja un usuario, M para modificarlo y L para listar los usuarios"
if %errorlevel% equ 1 goto badmin
if %errorlevel% equ 2 goto Modificar
if %errorlevel% equ 3 (
cls 
dir /b
pause
goto Menu
)

:P
cd pendientes
timeout 2 /nobreak > nul
cls
echo Usted esta gestionando los usuarios Pendientes
timeout 2 /nobreak > nul
dir /b
timeout 2 /nobreak > nul
echo A que usuario desea gestionar? (ingrese 0 para salir)
dir /b
set /p ced2= Usuario: 
if %ced2% equ 0 goto Menu
if exist %ced2% goto pendientes
goto Menu

:bagente
cls
echo Que usuario va a dar de baja?
dir /b
set /p ced3=Usuario:
timeout 1 /nobreak > nul
cls
choice /c FL /m "F para una baja fisica, L para una baja logica"
if %errorlevel% equ 1 (
del %posicion%\proyecto\Usuario\Agentes
rd %posicion%\proyecto\Usuario\Agentes
goto A
)
if %errorlevel% equ 2 (
move "%posicion%\proyecto\Usuario\Agentes\%ced3%" "%posicion%\proyecto\Usuario\Baja_Logica"
)

:busuario
cls
echo Que usuario va a dar de baja?
dir /b
set /p ced3=Usuario:
timeout 1 /nobreak > nul
cls
choice /c FL /m "F para una baja fisica, L para una baja logica"
if %errorlevel% equ 1 (
del %posicion%\proyecto\Usuario\Clientes
rd %posicion%\proyecto\Usuario\Clientes
goto C
)
if %errorlevel% equ 2 (
move "%posicion%\proyecto\Usuario\Clientes\%ced3%" "%posicion%\proyecto\Usuario\Baja_Logica"
)

:badmin
cls
echo Que usuario va a dar de baja?
dir /b
set /p ced3=Usuario:
timeout 1 /nobreak > nul
cls
choice /c FL /m "F para una baja fisica, L para una baja logica"
if %errorlevel% equ 1 (
del %posicion%\proyecto\Usuario\Administradores
rd %posicion%\proyecto\Usuario\Administradores
goto M
)
if %errorlevel% equ 2 (
move "%posicion%\proyecto\Usuario\Administradores\%ced3%" "%posicion%\proyecto\Usuario\Baja_Logica"
)

:Modificar


:a1
move "%ced2%" "%posicion%\proyecto\Usuarios\Agentes"
goto P

:c1
move "%ced2%" "%posicion%\proyecto\Usuarios\Clientes"
goto P

:m1
move "%ced2%" "%posicion%\proyecto\Usuarios\Administradores"
goto P

:pendientes
cls
choice /c ACM /m "A para aceptarlo en los Agentes, C para unirlo en clientes, M para aceptarlo como administrador"
if %errorlevel% equ 1 goto a1
if %errorlevel% equ 2 goto c1
if %errorlevel% equ 3 goto m1

:end
cd %proyecto%