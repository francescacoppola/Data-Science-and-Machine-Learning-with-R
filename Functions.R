v <- "I am a global variable"
stuff <- "I am global stuff"

fun <- function(stuff){
  print (v)
  stuff <- "reassign stuff inside of this function fun"
  print (stuff)
}

fun(stuff)
print(stuff)
