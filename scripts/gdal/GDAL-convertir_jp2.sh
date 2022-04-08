for  i in *.tif;
 do  
	gdal_translate -of JP2OPENJPEG -b 1 -b 2 -b 3 -b 4 -a_srs EPSG:25830 -co QUALITY=5  "$i" ${i//.tif/.jp2}
done
 
