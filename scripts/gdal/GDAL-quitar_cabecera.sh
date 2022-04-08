for i in *.tif;
	do
		gdal_translate -of GTiff -co profile=baseline "$i" ${i//.tif/_sin_cabecera.tif}
	done


