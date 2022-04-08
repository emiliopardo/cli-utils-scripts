::Convertir a jp2


FOR  %%i in (*.tif) do  (
SET fichero=%%i
SETLOCAL ENABLEDELAYEDEXPANSION

gdal_translate -of JP2OPENJPEG -b 1 -b 2 -b 3 -b 4 -a_srs EPSG:25830 -co QUALITY=5  %%i !fichero:.tif=.jp2!
)