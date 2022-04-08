mkdir "mta10_2013_8bits_LZW/";

for i in *.tif;
	do
		gdal_translate -co compress=lzw -a_srs epsg:25830 "$i" ${i//_8bits.tif/_8bits_LZW.tif}
	done
for j in *_8bits_LZW.tif;
	do
        mv "$j" mta10_2013_8bits_LZW/
    done
done
