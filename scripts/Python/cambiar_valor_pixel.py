import gdal, ogr, osr, os
import numpy as np

def raster2array(rasterfn):
    raster = gdal.Open(rasterfn)
    band = raster.GetRasterBand(1)
    return band.ReadAsArray()

def getNoDataValue(rasterfn):
    raster = gdal.Open(rasterfn)
    band = raster.GetRasterBand(1)
    return band.GetNoDataValue()

def array2raster(rasterfn,newRasterfn,array):
    raster = gdal.Open(rasterfn)
    geotransform = raster.GetGeoTransform()
    originX = geotransform[0]
    originY = geotransform[3]
    pixelWidth = geotransform[1]
    pixelHeight = geotransform[5]
    cols = raster.RasterXSize
    rows = raster.RasterYSize

    driver = gdal.GetDriverByName('GTiff')
    #outRaster = driver.Create(newRasterfn, cols, rows, 1, gdal.GDT_Float32)
    outRaster = driver.Create(newRasterfn, cols, rows, 1, gdal.GDT_Byte)
    outRaster.SetGeoTransform((originX, pixelWidth, 0, originY, 0, pixelHeight))
    outband = outRaster.GetRasterBand(1)
    outband.WriteArray(array)
    outRasterSRS = osr.SpatialReference()
    outRasterSRS.ImportFromWkt(raster.GetProjectionRef())
    outRaster.SetProjection(outRasterSRS.ExportToWkt())
    outband.FlushCache()


rasterfn = '20150925_MTA_TIF_30098432_8bits.tif'
newValue = 0
newRasterfn = '20150925_MTA_TIF_30098432_8bits_nuevo.tif'

# Convert Raster to array
rasterArray = raster2array(rasterfn)

np.savetxt('prueba.txt',rasterArray)


# Get no data value of array
noDataValue = getNoDataValue(rasterfn)

# Updata no data value in array with new value
rasterArray[rasterArray == noDataValue] = newValue

# Write updated array to new raster
array2raster(rasterfn,newRasterfn,rasterArray)
