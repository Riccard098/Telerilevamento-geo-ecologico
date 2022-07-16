# Recall libraries
library(raster)
library(RStoolbox)
library(ggplot2)
install.packages("viridis")
library(viridis)
library(patchwork)

# Set Workdirectory
setwd("C:/Users/kirir/OneDrive/Desktop/lab")

# Import and rename data
sen <- brick("sentinel.png")

# Plotting data
ggRGB(sen, 1, 2, 3, stretch="lin")

# Patch data 
p1 <- ggRGB(sen, 1, 2, 3, stretch="lin")
p2 <- ggRGB(sen, 2, 1, 3, stretch="lin")
p1 + p2

# calculation of variability over NIR
nir <- sen[[1]]
sd3 <- focal(nir, matrix(1/9, 3, 3), fun=sd)
plot(sd3)

# Creation of a specific palette
clsd <- colorRampPalette(c("blue", "green", "pink", "magenta", "orange", "brown", "red", "yellow")) (100)

# Plot
plot(sd3, col=clsd)

# Plotting with ggplot
ggplot() + geom_raster(sd3, mapping=aes(x, y, fill=layer))

# Plotting with Viridis
ggplot() + geom_raster(sd3, mapping=aes(x, y, fill=layer)) + scale_fill_viridis()
sd7 <- focal(nir, matrix(1/49, 7, 7), fun=sd)
