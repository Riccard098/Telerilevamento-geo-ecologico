#recall libraries
library(raster)
library(terra)
library(rasterVis) 
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(patchwork)

#set Workdirectory
setwd("C:/Users/kirir/OneDrive/Desktop/lab3")

# Convert the .hdf downloaded from "Earthdata search" in .tiff's files
a <- sds("C:/Users/kirir/OneDrive/Desktop/lab3/MOD11B3.A2000122.h18v04.006.2015160142027.hdf")
a
b <- a[1]
writeRaster (b, "C:/Users/kirir/OneDrive/Desktop/lab3/lst_2000.tif")

c <- sds("C:/Users/kirir/OneDrive/Desktop/lab3/MOD11B3.A2005121.h18v04.006.2015252170612.hdf")
c
d <- c[1]
writeRaster (d, "C:/Users/kirir/OneDrive/Desktop/lab3/lst_2005.tif")

e <- sds("C:/Users/kirir/OneDrive/Desktop/lab3/MOD11B3.A2010121.h18v04.006.2016039155825.hdf")
e
f <- e[1]
writeRaster (f, "C:/Users/kirir/OneDrive/Desktop/lab3/lst_2010.tif")

g <- sds("C:/Users/kirir/OneDrive/Desktop/lab3/MOD11B3.A2015121.h18v04.006.2016222212352.hdf")
g
h <- e[1]
writeRaster (h, "C:/Users/kirir/OneDrive/Desktop/lab3/lst_2015.tif")

i <- sds("C:/Users/kirir/OneDrive/Desktop/lab3/MOD11B3.A2020122.h18v04.006.2020153184216.hdf")
i
j <- i[1]
writeRaster (j, "C:/Users/kirir/OneDrive/Desktop/lab3/lst_2020.tif")

k <- sds("C:/Users/kirir/OneDrive/Desktop/lab3/MOD11B3.A2022121.h18v04.006.2022158001206.hdf")
k
l <- k[1]
writeRaster (l, "C:/Users/kirir/OneDrive/Desktop/lab3/lst_2022.tif")

# Import and rename datas
lst_00 <- raster("lst_2000.tif")
lst_05 <- raster("lst_2005.tif")
lst_10 <- raster("lst_2010.tif")
lst_15 <- raster("lst_2015.tif")
lst_20 <- raster("lst_2020.tif")
lst_22 <- raster("lst_2022.tif")

 # Par toghether the plots of the datas 
par(mfrow=c(3,2))
plot(lst_00)
plot(lst_05)
plot(lst_10)
plot(lst_15)
plot(lst_20)
plot(lst_22)

# List all files
rlist <- list.files(pattern="lst")

# Apply the function "raster" to rlist
import <- lapply(rlist,raster) 

# Merge files
TAl <- stack(import)

# Plot the new file
plot(TAl)

# Create a specific palette
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)

# Plot the new file with the specific palette
plot(TAl, col=cl)

# Save all the plot as .jpg's files in your workdirectory and cut them
plot(lst_00, col=cl)
plot(lst_05, col=cl)
plot(lst_10, col=cl)
plot(lst_15, col=cl)
plot(lst_20, col=cl)
plot(lst_22, col=cl)

# Rename downloaded .jpg files in order to avoi conficts with previous files while recalling them

# Import the .jpg files
M00 <- brick("m_00.jpg")
M05 <- brick("m_05.jpg")
M10 <- brick("m_10.jpg")
M15 <- brick("m_15.jpg")
M20 <- brick("m_20.jpg")
M22 <- brick("m_22.jpg")

# Visualize datas
p1 <- ggRGB(M00, 1, 2, 3, stretch="hist")
p2 <- ggRGB(M05, 1, 2, 3, stretch="hist")
p3 <- ggRGB(M10, 1, 2, 3, stretch="hist")
p4 <- ggRGB(M15, 1, 2, 3, stretch="hist")
p5 <- ggRGB(M20, 1, 2, 3, stretch="hist")
p6 <- ggRGB(M22, 1, 2, 3, stretch="hist")

# Plot all the plot together
(p1 + p2 +p3) / (p4 + p5 +p6)

# Divide each image in classes
M00c <- unsuperClass(M20, nClasses=5)
M05c <- unsuperClass(M05, nClasses=5)
M10c <- unsuperClass(M10, nClasses=5)
M15c <- unsuperClass(M15, nClasses=5)
M20c <- unsuperClass(M20, nClasses=5)
M22c <- unsuperClass(M22, nClasses=5)


# Calculate the frequency of each class in each image
freq(M00c$map)
freq(M05c$map)
freq(M10c$map)
freq(M15c$map)
freq(M20c$map)
freq(M22c$map)

# Recall the images and verify pixels amount of each image
M00
M05
M10
M15
M20
M22

# Rename total pixels on each image
tot00 <- 134625
tot05 <- 135750
tot10 <- 135026
tot15 <- 134653
tot20 <- 136864
tot22 <- 135375 



