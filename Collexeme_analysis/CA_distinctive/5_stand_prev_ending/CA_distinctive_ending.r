# Install packages and open libraries
install.packages(c("ggplot2", "corrgram"))
library(Rling); library(ggplot2); library(corrgram); library(tidyverse); library(collustructions)

# Open file (csv saved as .RData)
stand_na <- read.table(file = file.choose())
stand_iva <- read.table(file = file.choose())
head(stand_na)
head(stand_iva)

# Change column names
colnames(stand_na)[1] <- "stand"
colnames(stand_na)[2] <- "na"
head(stand_na)

colnames(stand_iva)[1] <- "stand"
colnames(stand_iva)[2] <- "iva"
head(stand_iva)

# See row numbers in the two datasets
nrow(stand_na)
nrow(stand_iva)

# Sum the frequencies of the constructional variants (how many stand in the two datasets)
sum(stand_na$na)
sum(stand_iva$iva)

# Create the vectors that contain the frequencies a, b, c and d for each stand --> create a data frame which contains all stands and has two columns, with the na and iva frequencies
ending <- merge(stand_na, stand_iva, by = "stand", all = TRUE)
head(ending)

# Replace the missing values (NA) with zeros
ending[is.na(ending)] <- 0
head(ending)

# From this point --> Flach's script:

collex.dist(ending, am = "fye") -> dist.ending
head(dist.ending, 12)
tail(dist.ending, 12)

write.csv(dist.ending, "YOUR_PATH/distinctive_ending.csv", row.names=TRUE)
