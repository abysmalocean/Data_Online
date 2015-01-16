
add2 <- function(x,y){
  x+y
}

above <- function(x,n = 10){
  use <- x>n
  x[use]
}

colum <- function(y){
  nc <- ncol(y)
  means <- numeric(nc)
  for(i in 1:nc){
    means[i] <- mean(y[,i],na.rm = )
  }
  means
}


x <- matrix(1:6,2,3)

for (i in seq_len(nrow(x))){
  for(j in seq_len(ncol(x))){
    print(x[i,j])
}
}

count <- 0
while (count<100){
  count <- count +1
  if (i >20){next}
  print(count)

}

x0<- 1
tol<-1e-8
repeat{
  x<-computeEs
}