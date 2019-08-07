animal <- c("d", "c", "d", "c", "c")
id <- c(1,2,3,4,5)
factor(animal)
fact.ani <- factor(animal)


#data frames

days <- c("Mon", "tue", "wed", "thu", "fri")
temp <- c(22.2, 21, 23, 24, 24.3)
rain <- c(T, F, T, F,F)

#PASS IN THE VECTOR
df <- data.frame(days, temp, rain)
df
df [, "rain"]

df <- data.frame(days, temp, rain)
subset(df, subset =rain ==T)


sorted.temp <- order(df["temp"])
sorted.temp
df[sorted.temp,]
desc.temp <- order(-df["temp"])
desc.temp


desc.temp <- order(-df$temp)
df[desc.temp,]


empty <- data.frame()
c1 <- 1:10
c1
letters

c2 <- letters[1:10]
c2
df <- data.frame(col.name.1= c1, col.name.2= c2)
df2 <- c(1,2,2,4,5,6,7,8,9,0)
df
dfnew <- rbind(df,df2)
?rbind
df2 <- data.frame (col.name.1=2000, col.name.2 ="new")
df2
dfnew <- rbind(df,df2)
dfnew
colnames(df)
df$newcol <- 2*df$col.name.1
df

df[,"newcol.copy2"] <- df$newcol1
df$newcol.copy <- df$newcol1
df

mtcars
mtcars[(mtcars$mpg > 20) & mtcars$cyl == 6,  ]

mtcars[(mtcars$mpg > 20) & mtcars$cyl == 6, c("mpg", "cyl", "hp") ]
subset(mtcars, mpg > 20 & cyl==6)
?subset
any(is.na(mtcars))
?any
?is.na
