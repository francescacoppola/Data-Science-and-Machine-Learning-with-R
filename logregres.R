adult <- read.csv("adult_sal.csv")
getwd()
setwd("C:/Users/fcoppola/Desktop/F.Coppola/Cursos/Udemy.DS and ML whit R/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Training Exercises/Machine Learning Projects/CSV files for ML Projects")
adult
print(head(adult))
library(dplyr)
adult <- select(adult, -X)
print(str(adult))
print(summary(adult))
table(adult$type_employer)
?select


####Data cleaning###
#Combine los tipos de empleo
unemp <- function(job){
  job <- as.character(job)
  if(job=='Never-worked' | job=='Without-pay'){
    return('Unemployed')
  }else{
    return(job)
  }
}


#APPLY

adult$type_employer <- sapply(adult$type_employer,unemp)

print(table(adult$type_employer))

?sapply
#GROUP SELF EMPLOYED AND STATE AND LOCAL
group_emp <- function(job){
  if (job=='Local-gov' | job=='State-gov'){
    return('SL-gov')
  }else if (job=='Self-emp-inc' | job=='Self-emp-not-inc'){
    return('self-emp')
  }else{
    return(job)
  }
}
adult$type_employer <- sapply(adult$type_employer,group_emp)
table(adult$type_employer)

######
adult$type_employer <- sapply(adult$type_employer, group_emp)
####
print(table(adult$type_employer))
####

###MARITAL STATUS
print(table(adult$marital))

group_marital <- function(mar){
  mar <- as.character(mar)
  
  # Not-Married
  if (mar=='Separated' | mar=='Divorced' | mar=='Widowed'){
    return('Not-Married')
    
    # Never-Married   
  }else if(mar=='Never-married'){
    return(mar)
    
    #Married
  }else{
    return('Married')
  }
}

#####APPPLY
adult$marital <- sapply(adult$marital, group_marital)

print(table(adult$marital))

table(adult$country)
Asia <- c('China','Hong','India','Iran','Cambodia','Japan', 'Laos' ,
          'Philippines' ,'Vietnam' ,'Taiwan', 'Thailand')

North.America <- c('Canada','United-States','Puerto-Rico' )

Europe <- c('England' ,'France', 'Germany' ,'Greece','Holand-Netherlands','Hungary',
            'Ireland','Italy','Poland','Portugal','Scotland','Yugoslavia')

Latin.and.South.America <- c('Columbia','Cuba','Dominican-Republic','Ecuador',
                             'El-Salvador','Guatemala','Haiti','Honduras',
                             'Mexico','Nicaragua','Outlying-US(Guam-USVI-etc)','Peru',
                             'Jamaica','Trinadad&Tobago')
Other <- c('South')


#####
###

group_country <- function(ctry){
  if (ctry %in% Asia){
    return('Asia')
  }else if (ctry %in% North.America){
    return('North.America')
  }else if (ctry %in% Europe){
    return('Europe')
  }else if (ctry %in% Latin.and.South.America){
    return('Latin.and.South.America')
  }else{
    return('Other')      
  }
}


adult$country <- sapply(adult$country, group_country)
###
print(table(adult$country))
?sapply

str

adult$type_employer <- sapply(adult$type_employer, factor)

adult$country <- sapply(adult$country, factor)
adult$marital <- sapply(adult$marital, factor)

?factor
print(str(adult))
print(table(adult$country))


###MISSING DATA

library(Amelia)
###
adult[adult=="?"] <- NA
##


#FACTOR
adult$type_employer <- sapply(adult$type_employer, factor)

adult$country <- sapply(adult$country, factor)
adult$marital <- sapply(adult$marital, factor)
###
print(table(adult$type_employer))


missmap(adult)
missmap(adult,y.at=c(1),y.labels = c('  '),col=c('yellow','black'))
###

#DROP MISSING DATA
adult <- na.omit(adult)

library(ggplot2)
library(dplyr)
ggplot(adult, aes(age)) + geom_histogram(aes(fill=income), color="black", binwidth = 1) + theme_bw()

ggplot(adult, aes(hr_per_week)) + geom_histogram() + theme_bw()


###
###RENAME COUNTRY TO REGION

adult <- rename(adult, region = country)
#
print(adult)

pl <- ggplot(adult, aes(region)) + geom_bar(aes(fill=income), color="black") + theme_bw()
pl

####LOGISTIC REGRESION MODEL
#########################


#TRAIN TEST SPLIT
library(caTools)
set.seed(101)
#
sample <- sample.split(adult$income, SplitRatio = 0.7)
summary(sample)

#TRAIN
train <- subset(adult, sample==T) 
#REST
test <- subset(adult, sample ==F)

?glm
model <- glm(income ~. , family = binomial())
model <- glm(income ~. , family = binomial(link = "logit"), data = train)
summary(model)

?step
new.step.model <- step(model)
test$predicted.income <- predict(model, newdata=test, type = "response")
table(test$income,test$predicted.income > 0.5)

acc <- (6372+1423)/(6372+1423+548+872)
acc
