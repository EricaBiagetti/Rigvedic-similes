# Install packages and open libraries
install.packages(c("ggplot2", "corrgram", "Cairo"))
library(Rling); library(ggplot2); library(corrgram); library(tidyverse)

# Choose file (csv saved as .RData): stand_head_lemma which contains lemma of the standard, its frequency in similles and its frequency outside similes
sim <- read.table(file = file.choose())
head(sim)

# mMke DF first columns as row names:
sim2 <- sim[,-1]
rownames(sim2) <- sim[,1]

# Set the four variables of the contingency table (see Levshina 2015: 224); as a default, columns are named V2 and V3 and correspond to Counts and Counts_VTB)
a <- sim2$V2
b <- sim2$V3 - a
c <- 2334 - a # total number of similes in the RV - a
d <- 55177 - (a + b + c) # all potential STANDs (= NOUN-ADJ-VERB(Part) depending on "root", "acl", "advcl", "acl:relcl", "acl:dpct", "xcomp", "advcl:temp", "ccomp", "advcl:dpct", "csubj", "acl:ptcp") - (a + b + c)

# Calculate the expected frequency of a standard in similes 
aExp <- (a + b)*(a + c)/(a + b + c + d)
head(aExp)

# Calculate p-values of all collexemes:
pvF <- pv.Fisher.collostr(a, b, c, d)
names(pvF) <- rownames(sim2) # assign names
round(head(pvF), 3) # For convenience, the coefficients are rounded up to three decimal points in order to get a more compact representation

# Log-transform p-values:
logpvF <- ifelse(a < aExp, log10(pvF), -log10(pvF))
names(logpvF) <- rownames(sim2) # assign names
round(head(logpvF), 3) # visualize
sort(logpvF, decreasing = TRUE)[1:100] # display in decreasing order (first 100 items); cu-off value = 1.30103

# Create a csv file with lemma (row.names = TRUE) and logpvF, in decreasing order
sorted = sort(round(logpvF, 3), decreasing = TRUE)
write.csv(sorted, "YOUR_PATH/simple_collexemes.csv", row.names=TRUE)


