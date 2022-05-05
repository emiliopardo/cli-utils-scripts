for i in *.tif;
	do
		gdalwarp -of GTiff -co "compress=LZW" -co "PREDICTOR=3" -s_srs EPSG:25829 -t_srs EPSG:25830 "$i" ${i//.tif/_25830.tif}
	done
