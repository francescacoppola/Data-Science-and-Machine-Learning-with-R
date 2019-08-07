library(ggplot2)
library(ggplot2movies)

#DATA & AESTHETICS
pl<- ggplot(movies,aes(x=rating))

#GEOMETRY
pl2 <-(pl+geom_histogram(binwidth =0.1, color= "red", fill="pink", alpha=0.4))
pl2

pl3 <- pl2 + xlab("Movie Rating") + ylab("Count")
pl3

pl3 + ggtitle("Francesca")

pl2 <-(pl+geom_histogram(binwidth =0.5, aes(fill=..count..)))
pl2
