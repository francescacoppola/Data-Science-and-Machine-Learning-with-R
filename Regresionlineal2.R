df <- read.csv("student-mat.csv", sep =";")
getwd()
setwd("C:/Users/fcoppola/Documents/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R")
getwd()
library(caTools)

set.seed(101)
#SPLIT UP SAMPLE
sample <- sample.split(df$G3, SplitRatio = 0.7)
#70% OF DATA -> TRAIN
train <- subset(df, sample== T)
#30% WILL BE TEST
test <- subset(df, sample== F)

#train and build model

model <- lm(G3 ~ ., data= train )

print(summary(model))
res <- residuals(model)
class(res)
res <- as.data.frame(res)
head(res)
library(ggplot2)
ggplot(res, aes(res)) + geom_histogram(fill = "blue", alpha=0.5)




#RUN MODEL

plot(model)

#PREDICTIONS
G3.predictions <- predict(model, test)

results <- cbind(G3.predictions, test$G3)
colnames(results) <- c("predicted", "actual")
results <- as.data.frame(results)
print(head(results))


#TAKE CARE OF NEG VALUES
to_zero <- function(x) {
  if(x<0){
    return(0)
  } else{
    return(x)
  }
}

#APPLY ZERO FUNCTION
results$predicted <- sapply(results$predicted, to_zero)
print(results)
##MEAN SQUARED ERROR

mse <- mean( (results$actual - results$predicted)^2)
print("MSE")
print(mse)


#RMSE
print("Squared Root of MSE")
print(mse^0.5)


SSE <- sum((results$predicted - results$actual)^2)
STT <- sum((mean(df$G3)- results$actual)^2)

R2 <- 1 - SSE/STT
print("R2")
print(R2)

bike <- read.csv("bikeshare.csv")



#Logistic regression
df.train <- read.csv("titanic_train.csv")
print(head(df.train))
print(str(df.train))

install.packages("Amelia")
library(Amelia)
help("missmap")


missmap(df.train, main = "missing map", col = c("yellow", "black"), legend = F)
library(ggplot2)

ggplot(df.train, aes(Survived)) + geom_bar()
ggplot(df.train, aes(Pclass)) + geom_bar(aes(fill=factor(Pclass)))
ggplot(df.train, aes(Sex)) + geom_bar(aes(fill=factor(Sex)))

ggplot(df.train, aes(Age)) + geom_histogram(bins=20, alpha=0.5, fill="blue")


ggplot(df.train, aes(SibSp)) + geom_bar()

ggplot(df.train, aes(Fare)) + geom_histogram(fill="green", color="black", alpha=0.5)

pl <- ggplot(df.train, aes(Pclass, Age))
pl <- pl + geom_boxplot(aes(group= Pclass, fill=factor(Pclass), alpha=0.4))
pl + scale_y_continuous(breaks=seq(min(0), max(80), by = 2))




impute_age <- function(age,class){
  out <- age
  for (i in 1:length(age)){
    
    if (is.na(age[i])){
      
      if (class[i] == 1){
        out[i] <- 37
        
      }else if (class[i] == 2){
        out[i] <- 29
        
      }else{
        out[i] <- 24
      }
    }else{
      out[i]<-age[i]
    }
  }
  return(out)
}

#####
fixed.ages <- impute_age(df.train$Age, df.train$Pclass)

df.train$Age <- fixed.ages

print(missmap(df.train, main = "Imputation check", col = c("yellow", "black"), legend= F))

df.train <- select(df.train, -PassengerId, -Name, -Ticket, -Cabin)
head(df.train,3)
str(df.train)


df.train$Survived <- factor(df.train$Survived)
df.train$Pclass <- factor(df.train$Pclass)
df.train$Parch <- factor(df.train$Parch)
df.train$SibSp <- factor(df.train$SibSp)

log.model <- glm(Survived ~. , family = binomial(link = "logit"), data = df.train)

summary(log.model)

library(caTools)
set.seed(101)
split <- sample.split(df.train$Survived, SplitRatio = 0.7)
final.train <- subset(df.train, split==T)
final.test <- subset(df.train, split==F)
final.log.model <- glm(Survived ~., family= binomial(link="logit"), data = final.train)
summary(final.log.model)
fitted.probabilities <- predict(final.log.model, newdata =  final.test, type= "response")
fitted.results <- ifelse(fitted.probabilities> 0.5, 1, 0)
misClassError <- mean(fitted.results != final.test$Survived)
print(1 - misClassError)
