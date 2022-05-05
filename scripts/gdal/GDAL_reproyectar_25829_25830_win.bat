::reproyectar sistemas de referencia a de 25829 a 25830


FOR  %%i in (*.tif) do  (
SET fichero=%%i
SETLOCAL ENABLEDELAYEDEXPANSION

gdalwarp -of GTiff -co "compress=LZW" -co "PREDICTOR=3" -s_srs EPSG:25829 -t_srs EPSG:25830  %%i !fichero:.tif=_25830.tif!
)
