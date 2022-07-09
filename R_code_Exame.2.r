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

cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)
plot(TAl, col=cl)

#Land Cover
lst_2000c <- unsuperClass(lst_2000, nClasses=4)
lst_2005c <- unsuperClass(lst_2005, nClasses=4)
lst_2010c <- unsuperClass(lst_2010, nClasses=4)
lst_2015c <- unsuperClass(lst_2015, nClasses=4)
lst_2020c <- unsuperClass(lst_2020, nClasses=4)
lst_2022c <- unsuperClass(lst_2022, nClasses=4)

par(mfrow=c(3,2))
plot(lst_2000c$map)
plot(lst_2005c$map)
plot(lst_2010c$map)
plot(lst_2015c$map)
plot(lst_2020c$map)
plot(lst_2022c$map)

freq(lst_2000c$map)
freq(lst_2005c$map)
freq(lst_2010c$map)
freq(lst_2015c$map)
freq(lst_2020c$map)
freq(lst_2022c$map)

lst_2000c$map
lst_2005c$map
lst_2010c$map
lst_2015c$map
lst_2020c$map
lst_2022c$map

