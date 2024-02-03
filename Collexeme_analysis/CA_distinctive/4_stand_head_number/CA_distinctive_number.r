install.packages(c("ggplot2", "corrgram"))
install.packages('Cairo')
library(Rling); library(ggplot2); library(corrgram); library(tidyverse); library(collostructions)

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

# Sum the frequencies of the cosntructonal variants (how many stand in the two datasets)
sum(stand_na$na)
sum(stand_iva$iva)

# Create the vectors that contain the frequencies a, b, c and d for each stand --> create a data frame which contains all stands and has two columns, with the na and iva frequencies
head.number <- merge(stand_na, stand_iva, by = "stand", all = TRUE)
head(head.number)

# Replace the missing values (NA) with zeros
head.number[is.na(head.number)] <- 0
head(head.number)

# From this point --> Flach's script:

collex.dist(head.number, am = "fye") -> dist.head.number
head(dist.head.number, 12)
tail(dist.head.number, 12)

write.csv(dist.head.number, "YOUR_PATH/distinctive_number.csv", row.names=TRUE)
