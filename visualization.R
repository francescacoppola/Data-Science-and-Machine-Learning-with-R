library(ggplot2)

df <- mtcars

pl <- ggplot(df,aes(x=wt, y=mpg))
pl

print(pl + geom_point(aes(size=factor(cyl))))

print(pl + geom_point(aes(shape=factor(cyl)), size=5, color="#f44242" ))
   
pl2 <- pl + geom_point(aes(color = hp), size=5)   

pl3<- pl2 + scale_color_gradient(low="blue", high= "red")
pl3


#---------------BARPLOTS

library(ggplot2)
df <- mpg
 pl <- ggplot(df, aes(x=class))
print(pl + geom_bar())
head(mpg)
print(pl + geom_bar(aes(fill=drv), position ="dodge"))


#----------------BOXPLOTS

library(ggplot2)
df <- mtcars
head(mtcars)

pl<-ggplot(df, aes(x=factor(cyl), y=mpg))
print(pl + geom_boxplot() + coord_flip())
print(pl + geom_boxplot(aes(fill=factor(cyl))) + theme_bw())


#--------------------two variables


library(ggplot2)
library(ggplot2movies)
pl <- ggplot(movies, aes(x=year, y=rating))
pl
pl + geom_bin2d()
pl2 <- pl + geom_bin2d(binwidth= c(12,1))
 print(pl2 + scale_fill_gradient(high="orange", low="red"))
 
 install.packages("hexbin")
pl2 <- pl + geom_hex()
pl2

pl2 <- pl + geom_density2d()
pl2

#-------

pl <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
pl2 <- pl + coord_cartesian(xlim = c(1,4), ylim= c(15,30))
pl2

pl2 <- pl + coord_fixed(ratio = 1/3 )
pl2



?FacetGrid

pl <- ggplot(mpg, aes(x=displ, y=hwy)) + geom_point()
pl

print(pl + facet_grid(.~cyl))
print(pl + facet_grid(drv~.))
print(pl + facet_grid(drv~cyl))


library(ggplot2)
pl<- ggplot(mtcars, aes (x=wt, y=mpg)) + geom_point()
pl

#theme_set

pl <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
print(pl + theme_dark())

install.packages("ggthemes")
print(pl + theme_grey())
