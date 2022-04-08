for  i in *_banda_infrarroja.tif;
 do  
	gdal_merge.py  -separate -o ${i//_banda_infrarroja.tif/_rgbi.tif}  ${i//_banda_infrarroja.tif/.tif} "$i"
done
