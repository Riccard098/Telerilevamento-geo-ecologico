#recall libraries
library(raster)
library(terra)
library(rasterVis) 
library(rgdal)
library(RStoolbox)
library(ggplot2)
library(patchwork)

#set Workdirectory
setwd("C:/Users/kirir/OneDrive/Desktop/lab2")

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


