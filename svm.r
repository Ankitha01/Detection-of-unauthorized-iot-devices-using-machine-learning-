library(tidyverse)
library(e1071)
library(dplyr)
library(caret)
a <- KDDTrain20 %>% select (5:19)
b <- KDDTrain20 %>% select (22:41)
KDDTrain <- cbind(a,b)
split = sample.split(KDDTrain$attack.new, SplitRatio = 0.75)
KDD_training = subset(KDDTrain, split == TRUE)
KDD_test = subset(KDDTrain, split == FALSE)
classifier <- svm(formula = attack.new~ ., data = KDD_training, scale = T, type = "C-classification", kernel = "linear")
print(classifier)
y_pred = predict(classifier, newdata = KDD_test)
cm = table(KDD_test$attack.new, y_pred)
print(confusionMatrix(cm))
