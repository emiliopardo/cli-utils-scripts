#Extraer banda 1(infraroja) de imagen cir

for i in *.tif;
	do
		gdal_translate -b 1  "$i" ${i//.tif/_banda_infrarroja.tif}
done
