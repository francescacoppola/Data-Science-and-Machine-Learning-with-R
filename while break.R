write.csv(mtcars, file="my_example.csv")
read.csv("my_example.csv")
install.packages("readxl")
library(readxl)
install.packages("xlxs")
library(xlsx)
df [(df$mpg > 20) & (df$hp > 100),]

hot <- F
temp <- 60
if (temp > 80) {
  print("temp is greater than 80")
}

temp <- 30
if (temp > 80) {
  print ("Hot outside")
} else {
  print("tem is not greater tan 80")
}
ham <- 10
cheese <- 10
report <- "blank"


x <- 0
while (x<10){
  print(paste0("x is: ", x))
  
  x <- x+1
  if(x==5){
    print("X is now equal to 10 break loop!")
 break
  }
}
