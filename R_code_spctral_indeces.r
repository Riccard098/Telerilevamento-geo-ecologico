# Recall library
library(raster)
library(RStoolbox)
library(rasterdiv)

# Set workdirecotory
setwd("C:/Users/kirir/OneDrive/Desktop/lab")

# Import and rename datas
l1992 <- brick("defor1_.jpg")
l2006 <- brick("defor2_.jpg")

# Difference Vegetation Index (DVI) of 1992's datas
dvi1992 = l1992[[1]] - l1992[[2]]

# Calculete Normalized Difference Vegetation Index (NDVI) of 1992's datas
ndvi1992 = (l1992[[1]] - l1992[[2]]) / (l1992[[1]] + l1992[[2]])

# Create a specific palette
cl <- colorRampPalette(c("dark blue", "yellow", "red","black")) (100)

# Plot in the same window the RGB plot of 1992 datas and the NDVI of 1992's
par(mfrow=c(2,1))
plotRGB(l1992, r=1, g=2, b=3, stretch="lin")
plot(ndvi1992, col=cl)

# Calculete Difference Vegetation Index (DVI) of 2006's datas
dvi2006 = l2006[[1]] - l2006[[2]]

# Calculete Normalized Difference Vegetation Index (NDVI) of 2006's datas
ndvil2006 = (l2006[[1]] - l2006[[2]]) / (l2006[[1]] + l2006[[2]])

# Plot in the same window the NDVI of 1992's datas and the NDVI of 2006's
par(mfrow=c(2,1))
plot(ndvi1992, col=cl)
plot(ndvi2006, col=cl)

# Calculate all the Spectral Indecis for the 1992's datas
si1992 <- spectralIndices(l1992, green=3, red=2, nir=1)

# Plot all the Spectral Indecis for the 1992's datas
plot(si1992, col = cl)
