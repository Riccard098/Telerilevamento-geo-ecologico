library(raster)
library(terra)
library(rasterVis) 
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(patchwork)

a <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2010209.h18v04.006.2016042155707.hdf")
a
b <- a[1]
writeRaster (b, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2010.tif")

c <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2015209.h18v04.006.2016224033554.hdf")
c
d <- c[1]
writeRaster (d, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2015.tif")

e <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2020177.h18v04.006.2020188052533.hdf")
e
f <- e[1]
writeRaster (f, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2020.tif")

g <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2022177.h18v04.006.2022186044616.hdf")
g
h <- e[1]
writeRaster (h, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2022.tif")


setwd("C:/Users/kirir/OneDrive/Desktop/lab2")

lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")
lst_2020 <- raster("lst_2020.tif")
lst_2022 <- raster("lst_2022.tif")


rlist <- list.files(pattern="lst")
import <- lapply(rlist,raster) 
# Merge files
TAl <- stack(import)
plot(TAl)
plotRGB(TAl, 4, 3, 2, stretch="Lin")
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TAl, col=cl)


