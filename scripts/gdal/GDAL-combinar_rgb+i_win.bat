::Extraer banda infrarroja de una imagen tiff


FOR  %%i in (*_banda_infrarroja.tif) do  (
SET fichero=%%i
SETLOCAL ENABLEDELAYEDEXPANSION

gdal_merge.py  -separate -o !fichero:_banda_infrarroja.tif=_rgbi.tif! !fichero:_banda_infrarroja.tif=.tif! %%i
)