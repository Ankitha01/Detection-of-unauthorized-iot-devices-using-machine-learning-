library(party)
library(randomForest)
library(tidyverse)
KDDTrain <- KDDTrain20 %>% select (5:41)
attack =as.factor((KDDTrain20[,42]))
KDDTrain$attack.new = attack
output.forest <- randomForest(formula = KDDTrain$attack.new~ ., data = KDDTrain, importance = T)
print(output.forest)
