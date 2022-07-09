library(raster)
library(terra)
library(rasterVis) 
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(patchwork)

a <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2000185.h18v04.061.2020051194135.hdf")
a
b <- a[1]
writeRaster (b, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2000.tif")

c <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2005185.h18v04.061.2020246181149.hdf")
c
d <- c[1]
writeRaster (d, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2005.tif")

e <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2010185.h18v04.061.2021175231615.hdf")
e
f <- e[1]
writeRaster (f, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2010.tif")

g <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2015185.h18v04.061.2021359101400.hdf")
g
h <- e[1]
writeRaster (h, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2015.tif")

i <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2020185.h18v04.061.2021012190329.hdf")
i
j <- i[1]
writeRaster (j, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2020.tif")

k <- sds("C:/Users/kirir/OneDrive/Desktop/lab2/MOD11A2.A2022177.h18v04.061.2022186044823.hdf")
k
l <- k[1]
writeRaster (l, "C:/Users/kirir/OneDrive/Desktop/lab2/lst_2022.tif")

setwd("C:/Users/kirir/OneDrive/Desktop/lab2")

lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")
lst_2020 <- raster("lst_2020.tif")
lst_2022 <- raster("lst_2022.tif")


 # Par toghether the plots of the datas 
par(mfrow=c(3,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)
plot(lst_2020)
plot(lst_2022)

rlist <- list.files(pattern="lst")
import <- lapply(rlist,raster) 
# Merge files
TAl <- stack(import)
plot(TAl)
plotRGB(TAl, 4, 3, 2, stretch="Lin")
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TAl, col=cl)

I valori degli assi sono invertiti nel tuo plot rispetto a quelli del plot del prof, cerca una soluzione! Forse è per questo che la Temperatura sembra aumentare
