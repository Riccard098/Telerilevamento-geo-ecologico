# Recall library
library(raster)
library(RStoolbox)
library(rasterdiv)

# Set workdirecotory
setwd("C:/Users/kirir/OneDrive/Desktop/lab")

# Import and rename data
l1992 <- brick("defor1_.jpg")
l2006 <- brick("defor2_.jpg")

# Difference Vegetation Index (DVI) of 1992's data
dvi1992 = l1992[[1]] - l1992[[2]]

# Calculete Normalized Difference Vegetation Index (NDVI) of 1992's data
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])

# Create a specific palette
cl <- colorRampPalette(c("dark blue", "yellow", "red","black")) (100)

# Plot in the same window the RGB plot of 1992 datas and the NDVI of 1992's with the new specific palette
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)

# Calculete Difference Vegetation Index (DVI) of 2006's data
dvi2006 = l2006[[1]] - l2006[[2]]

# Calculete Normalized Difference Vegetation Index (NDVI) of 2006's data
ndvil2006 = (l2006[[1]] - l2006[[2]]) / (l2006[[1]] + l2006[[2]])

# Plot in the same window the NDVI of 1992's data and the NDVI of 2006's with the specific palette
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# Calculate all the Spectral Indecis for the 1992's data
si1992 <- spectralIndices(l1992, green=3, red=2, nir=1)

# Plot all the Spectral Indecis for the 1992's data with the specific palette
plot(si1992, col = cl)
