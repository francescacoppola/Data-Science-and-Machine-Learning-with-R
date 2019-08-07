df<-read.csv("student-mat.csv", sep=";")
head(df)
#  getwd()
#[1] "C:/Users/fcoppola/Documents"
#setwd("C:/Users/fcoppola/Documents/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R")
> 
  > #getwd()
[1] #"C:/Users/fcoppola/Documents/R-Course-HTML-Notes/R-Course-HTML-Notes/R-for-Data-Science-and-Machine-Learning/Machine Learning with R"
> #read.csv("student_mat.csv")
  any(is.na(df))
str(df)

library(ggplot2)
library(ggthemes)
library(dplyr)

#num only
num.cols <- sapply(df, is.numeric)
#filter
cor.data <- cor(df[,num.cols])

print(cor.data)

install.packages("corrgram")
library(corrgram)
library(corrplot)
install.packages("corrplot")
library(corrplot)

print(corrplot(cor.data, method="color"))

corrgram(df)
help("corrgram")
corrgram(df, order=T, lower.panel = panel.shade, 
         upper.panel=panel.pie, text.panel=panel.txt)

ggplot(df,aes(x=G3)) +  geom_histogram(bins=20, alpha=0.5, fill="blue")

install.packages("caTools")
