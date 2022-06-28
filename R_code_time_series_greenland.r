# Recall libraries
library(raster)
library(rasterVis) 
library(rgdal)

# Import datas
setwd("C:/Users/kirir/OneDrive/Desktop/lab/greenland")
 
# Rename datas
lst_2000 <- raster("lst_2000.tif")
lst_2005 <- raster("lst_2005.tif")
lst_2010 <- raster("lst_2010.tif")
lst_2015 <- raster("lst_2015.tif")

# Par toghether the plots of the datas 
par(mfrow=c(2,2))
plot(lst_2000)
plot(lst_2005)
plot(lst_2010)
plot(lst_2015)

# List all files
rlist <- list.files(pattern="lst")

# Apply the function "raster" to rlist
import <- lapply(rlist,raster)

# Merge files
TGr <- stack(import)

# PlotRGB TGr in different ways to find the best
plot(TGr)

plotRGB(TGr, 1, 2, 3, stretch="Lin") 
plotRGB(TGr, 2, 3, 4, stretch="Lin") 
plotRGB(TGr, 4, 3, 2, stretch="Lin") 

# Create a specific palette
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)

# Plot Tgr with the new palette
plot(TGr, col=cl)



##########################
#### Example 2: NO2 decrease during the lockdown period
##########################

# Recall libraries
library(raster)

# Import datas
setwd("C:/Users/kirir/OneDrive/Desktop/lab/en")

# Import and rename datas
en01 <- raster("EN_0001.png") 

# Create a specific palette
cl <- colorRampPalette(c('red','orange','yellow'))(100)

# Plot the datas with the specific palette
plot(en01, col=cl)

# Import and rename new datas
en13 <- raster("EN_0013.png")

# Plot the new datas
plot(en13, col=cl)

# Import the whole data set 
# List all files
rlist <- list.files(pattern="EN")

# Apply the function "raster" to rlist
rimp <- lapply(rlist, raster)

# Merge files
en <- stack(rimp)

# Plot the datas
plot(en, col=cl)

# Plot EN01 besides EN13
par(mfrow=c(1,2))
plot(en[[1]], col=cl)
plot(en[[13]], col=cl)


# Make the difference between en01 and en13
difen <-  en[[1]] - en[[13]]

# Create a specific palette
cldif <- colorRampPalette(c('blue','white','red'))(100)

# Plot the new datas
plot(difen, col=cldif)

# PlotRGB  
plotRGB(en, r=1, g=7, b=13, stretch="lin")
plotRGB(en, r=1, g=7, b=13, stretch="hist")

