# Recalling libraries
install.packages("colorist")
library(colorist)
library(ggplot2)


# Setting Workdirectory
data("fiespa_occ")


# Importing and renaming data
met1<-metrics_pull(fiespa_occ) 


# Creating a new palette
pal<- palette_timecycle(fiespa_occ)


# Plotting all months' maps
map_multiples(met1, pal, ncol=3, labels=names(fiespa_occ))


# Creating a new palette
p1custom <- palette_timecycle(12, start_hue=60)


# Plotting all months' maps with the second new palette
map_multiples(met1, p1custom, ncol=3, labels=names(fiespa_occ))


# Isoleting and plotting one single map
met1_distill<-metrics_distill(fiespa_occ)
map_single(met1_distill,p1custom)


# Setting a new Workdirectory
data("fisher_ud") 


# Importing and renaming data
m2 <- metrics_pull(fisher_ud)


# Creating a new palette
pal2<-palette_timeline(fisher_ud)


# Plotting different maps
head(pal2)
map_multiples(m2,ncol = 3, pal2)
map_multiples(m2,ncol = 3, pal2, lambda_i = -12)
m2_distill<-metrics_distill(fisher_ud)
map_single(m2_distill,pal2,lambda_i = -5)
