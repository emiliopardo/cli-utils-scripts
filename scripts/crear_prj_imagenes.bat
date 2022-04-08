FOR  %%i in (*.tif) do  (
SET fichero=%%i
SETLOCAL ENABLEDELAYEDEXPANSION
::copy 25829.prj !fichero:.tif=.prj!
copy 25830.prj !fichero:.tif=.prj!

)
