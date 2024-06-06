# a = c(1:5)

category = c("obat keras", "obat biasa")
category

a=matrix(1:10,ncol=2, byrow=TRUE)
nrow(a)
a[,1]
a

f = function(){
  "Halo"
}

f()

g = function(x,y){
  b <<- x+y
}

g(2, 10)
b

colnames(a)=c("x","y")
row.names(a)=c("a", "b", "c", "d", "e")
a