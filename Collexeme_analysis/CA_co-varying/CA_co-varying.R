library(collostructions)

## SEE INSTRUCTIONS

?collex.covar

## Choose file (csv saved as .RData): standpar_lemma or standpar_class
sim <- read.table(file = file.choose())
head(sim, 10)

# Default am = logl
collex.covar(sim, delta.p = 'TRUE') -> covar.out # .out specifies that we don't want all possible combination to be computed

# Preferred am = fye
collex.covar(sim, am = "fye", delta.p = 'TRUE') -> covar.out # .out specifies that we don't want all possible combination to be computed


head (covar.out, 100)
write.csv(covar.out, "/YOUR_PATH/covarying_collexems.csv", row.names=TRUE)
