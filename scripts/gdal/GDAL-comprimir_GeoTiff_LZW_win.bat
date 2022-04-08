::Añadir cabecera a tif y comprimir en LZW

::FOR  %%i in (*.tif') do  (
::SET "fichero=%%i"
::SETLOCAL ENABLEDELAYEDEXPANSION
::gdal_translate -a_srs EPSG:25830 -of GTiff -co "compress=LZW" %%i !fichero:.tif=_lzw.tif! >nul
::)


::Extraer banda infrarroja de una imagen tiff


FOR  %%i in (*.tif') do  (
SET "fichero=%%i"
SETLOCAL ENABLEDELAYEDEXPANSION
gdal_translate -a_srs EPSG:25830 -of GTiff -co "compress=LZW" -b 1 %%i !fichero:.tif=_banda_infrarroja.tif! >nul
)


:: Crear una imagen con cuatro bandas a partir de imagen rgb e imange monobanda infrarrojo.

FOR  %%i in (*_banda_infrarroja.tif') do  (
SET "fichero=%%i"
SETLOCAL ENABLEDELAYEDEXPANSION

gdal_merge -init "255 255 255" -separate -o !fichero:_banda_infrarroja.tif=_rgbi.tif! %%i !fichero:_banda_infrarroja.tif=.tif! >null
)
