# Recall libraries
library(raster)
library(terra)
library(RStoolbox)
library(ggplot2)
library(patchwork)

# Set Workdirectory
setwd("C:/Users/kirir/OneDrive/Desktop/lab2")

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

# Close the previous window to reset the plot settings
dev.off()

# Plot the new file
plot(TAl)

# Create a specific palette
cl <- colorRampPalette(c("blue","light blue","pink","red"))(100)

# Plot the new file with the specific palette
plot(TAl, col=cl)


# Import the .jpg files
M00 <- brick("m_00.jpg")
M05 <- brick("m_05.jpg")
M10 <- brick("m_10.jpg")
M15 <- brick("m_15.jpg")
M20 <- brick("m_20.jpg")
M22 <- brick("m_22.jpg")

# Visualize datas
p1 <- ggRGB(M00, 1, 2, 3, stretch="lin")
p2 <- ggRGB(M05, 1, 2, 3, stretch="lin")
p3 <- ggRGB(M10, 1, 2, 3, stretch="lin")
p4 <- ggRGB(M15, 1, 2, 3, stretch="lin")
p5 <- ggRGB(M20, 1, 2, 3, stretch="lin")
p6 <- ggRGB(M22, 1, 2, 3, stretch="lin")

# Plot all the plot together
(p1 + p2 + p3) / (p4 + p5 + p6)

# Divide each image in classes
M00c <- unsuperClass(M00, nClasses=6)
M05c <- unsuperClass(M05, nClasses=6)
M10c <- unsuperClass(M10, nClasses=6)
M15c <- unsuperClass(M15, nClasses=6)
M20c <- unsuperClass(M20, nClasses=6)
M22c <- unsuperClass(M22, nClasses=6)


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
tot00 <- 135375
tot05 <- 135375
tot10 <- 135375
tot15 <- 135375
tot20 <- 135375
tot22 <- 135375

# Calculate proportion of frost areas per year
prop_frost_00 <- 1128 / tot00
prop_frost_05 <- 956 / tot05
prop_frost_10 <- 1178 / tot10
prop_frost_15 <- 811 / tot15
prop_frost_20 <- 711 / tot20
prop_frost_22 <- 439 / tot22

# Check proportions
prop_frost_00
prop_frost_05
prop_frost_10
prop_frost_15
prop_frost_20
prop_frost_22

# Calculate percentage of frost areas per year
perc_frost_00 <- prop_frost_00 * 100
perc_frost_05 <- prop_frost_05 * 100
perc_frost_10 <- prop_frost_10 * 100
perc_frost_15 <- prop_frost_15 * 100
perc_frost_20 <- prop_frost_20 * 100
perc_frost_22 <- prop_frost_22 * 100

# Check percentages
perc_frost_00
perc_frost_05
perc_frost_10
perc_frost_15
perc_frost_20
perc_frost_22


# Create a dataframe
Years <- c("2000", "2005", "2010", "2015", "2020", "2022")
Percent_frost <- c("0.833241", "0.7061865", "0.8701754", "0.5990766", "0.5252078", "0.3242844")
Balrog <- data.frame(Years, Percent_frost)
View(Balrog)

# Plot the data
ggplot(Balrog, aes(Years, Percent_frost, group = 1)) +
           geom_point() +
           geom_line() +
           labs(x = "Years", y = "Percentage of frost pixels", title = "Variation of the percentage of frost areas from 2000 to 2022")

# Calculate the percentage change through time from 2000 to 2022
perc_00 <- (perc_frost_00 * 100)/ 0.833241
perc_22 <- (perc_frost_22 * 100)/ 0.833241
total_percentage_change <- (percentage_change_00 - percentage_change_22)
total_percentage_change
