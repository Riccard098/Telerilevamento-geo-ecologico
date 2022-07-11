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
plot(lst_2000, col=cl)
plot(lst_2005, col=cl)
plot(lst_2010, col=cl)
plot(lst_2015, col=cl)
plot(lst_2020, col=cl)
plot(lst_2022, col=cl)

# Rename downloaded .jpg files in order to avoi conficts with previous files while recalling them

# Import the .jpg files
M2000 <- brick("m_2000.jpg")
...

# Visualize datas
par(mfrow=c(3,2))
ggRGB(M2000, 1, 2, 3, stretch="lin")
...

# Divide each image in classes
M2000c <- unsuperClass(M2000, nClasses=5)
...


# Calculate the frequency of each class in each image
freq(M2000c$map)
...
