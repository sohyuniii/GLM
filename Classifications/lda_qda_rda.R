library(MASS)
library(dplyr)
library(ggplot2)

data = read.table("http://www-stat.stanford.edu/~tibs/ElemStatLearn/datasets/SAheart.data",
                  sep=",",head=T,row.names=1)
head(data)
data$famhist = ifelse(data$famhist=="Present",1,0)
pairs(data[,1:9], main="My Title ", pch=22,
      bg=c('yellow')[unclass(data$chd)])

# LDA
fit.lda <- lda(chd ~ ., data=data,na.action="na.omit", CV=TRUE)
mean(fit.lda$class==data$chd)  # 72%
ggplotlda
  
# QDA
fit.qda <- qda(chd ~ ., data=data) 
predictions <- fit.qda %>% predict(data)
mean(predictions$class==data$chd) # 75.75%

# RDA
library(klaR)
fit.rda <- rda(chd ~ ., data=data)
predictions <- fit.rda %>% predict(data)
mean(predictions$class == data$chd) # 75.54%
