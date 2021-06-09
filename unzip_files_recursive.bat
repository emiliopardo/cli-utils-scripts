@REM añadir varieble de entorno cuenta de usuario path a 7-zip C:\Program Files\7-Zip
SET directory=%cd%

for %%i in (*.zip) do (
    mkdir %%~ni
    7z e %%i "-o%directory%\%%~ni\"
)

@REM Se borran los subdirectorios generados al extraer el fichero zip
for /R %directory% %%G in (.) do (
 rmdir %%G
)

mkdir %directory%\shapefiles\

@REM se itera por por todos los ficheros del directorio padre al descomprimir el zip y se renombran los archivos con el sufijo del directorio padre
for /R %directory% %%I in (.) do (
 cd %directory%\%%~nxI\
 for %%z   in (%directory%\%%~nxI\*.*) do (
   ren %%z %%~nz_%%~nI%%~xz

 )
@REM  movemos todos los archivos a un directorio
 move %directory%\%%~nxI\*.* %directory%\shapefiles\
 cd ..
)