# Recall libraries
library(raster)
library(RStoolbox)
library(ggplot2)
library(patchwork)
library(viridis)

# Set Workdirectory
setwd("C:/Users/kirir/OneDrive/Desktop/lab")

# Import and rename data
sen <- brick("sentinel.png")

# RGBplot data in different ways
ggRGB(sen, 1, 2, 3, stretch="hist")
ggRGB(sen, 2, 1, 3, stretch="hist")

# Import a single data from a pack
sen_pca <- rasterPCA(sen)
summary(sen_pca$model)

# Plot the data
plot(sen_pca$map)

# Import and rename data
pc1 <- sen_pca$map$PC1
pc2 <- sen_pca$map$PC2
pc3 <- sen_pca$map$PC3


# Rename the plots
g1 <- ggplot() + geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))
g2 <- ggplot() + geom_raster(pc2, mapping=aes(x=x, y=y, fill=PC2))
g3 <- ggplot() + geom_raster(pc3, mapping=aes(x=x, y=y, fill=PC3))

# Patch plots toghether
g1+g2+g3

# Plot sd3
sd3 <- focal(pc1, matrix(1/9, 3, 3), fun=sd)
ggplot() + geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer))
ggplot() + geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="inferno")
im1 <- ggRGB(sen, 2, 1, 3)
im2 <- ggplot() + geom_raster(pc1, mapping=aes(x=x, y=y, fill=PC1))
im3 <- ggplot() + geom_raster(sd3, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="inferno") 
im1 + im2 + im3
sd5 <- focal(pc1, matrix(1/25, 5, 5), fun=sd)
ggplot() + geom_raster(sd5, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="inferno")
im4 <- ggplot() + geom_raster(sd5, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="inferno")
im3 + im4
sd7 <- focal(pc1, matrix(1/49, 7, 7), fun=sd)
ggplot() + geom_raster(sd7, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="inferno")
im5 <- ggplot() + geom_raster(sd7, mapping=aes(x=x, y=y, fill=layer)) + scale_fill_viridis(option="inferno")
im1 + im2 + im3 + im4 + im5
