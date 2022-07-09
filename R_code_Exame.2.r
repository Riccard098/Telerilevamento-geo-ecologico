library(raster)
library(terra)
library(rasterVis) 
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(patchwork)

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
TAl <- stack(import)
plot(TAl)

plotRGB(TAl, 4, 3, 2, stretch="Lin")
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TAl, col=cl)
