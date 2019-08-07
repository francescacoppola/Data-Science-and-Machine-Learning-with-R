v <- c(1,2,3)
m <- matrix(1:10, nrow = 2)
df <- mtcars
class(v)
class(m)
class(df)
my.list <- list(v,m,df)
my.list

my.named.list <- list(sample.vec = v, my.matrix= m, sample.df =df)
my.named.list
