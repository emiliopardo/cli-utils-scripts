::Extraer banda infrarroja de una imagen tiff


for  %%i in (*.tif) do  (
SET fichero=%%i
SETLOCAL ENABLEDELAYEDEXPANSION
gdal_translate -b 1 %%i !fichero:.tif=_banda_infrarroja.tif!
)

