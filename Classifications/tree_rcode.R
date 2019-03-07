setwd("C:/Users/user/Desktop/I/ewha2/Seminar/Classifications")
library(dplyr)
library(rpart)
library(caret)
library(party)

data <- read.csv("diabetes.csv")
colnames(data) <- c('pregnant', 'glucose', 'bp', 'skin', 'insulin', 'bmi', 'pedigree', 'age', 'label')
head(data)
count(data,label)


# Split train and test

set.seed(1000) #reproducability setting
intrain<-createDataPartition(y=data$label, p=0.7, list=FALSE) 
train<-data[intrain, ]
test<-data[-intrain, ]


# a) Tree modeling -> "rapart" package

rpartmod<-rpart(label~. , data=train, method="class")
plot(rpartmod)
text(rpartmod)

# pruning
printcp(rpartmod)
plotcp(rpartmod)

# predict & validation
ptree<-prune(rpartmod, cp= rpartmod$cptable[which.min(rpartmod$cptable[,"xerror"]),"CP"])
plot(ptree)
text(ptree)
rpartpred<-predict(ptree, test, type='class')
confusionMatrix(rpartpred, as.factor(test$label))


# a) Tree modeling -> "party" package
train$label = as.factor(train$label)
partymod<-ctree(label~., data=train)
plot(partymod)
partypred<-predict(partymod, test)
confusionMatrix(partypred, as.factor(test$label))
