import gdal
    
from gdalconst import * 

filename = "poligonos_rellenos_8bits.png"

dataset = gdal.Open(filename, GA_ReadOnly) 
cols = dataset.RasterXSize
rows = dataset.RasterYSize

print cols
print rows


scanline = band.ReadRaster( 0, 0, band.XSize, 1, band.XSize, 1,GDT_Byte)
