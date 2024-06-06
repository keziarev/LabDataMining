# variables
# untuk run control + enter

# cara pertama bikin variable
name <- 'Budi'
name

# cara 2
num1 = 17
num1

# cara 3
18 -> num2
num2

# tipe data di r
# 2 jenis

# scalar -> hanya bisa nampung 1 variable aja
# num, int, string, boolean

# non scalar -> vector, matrix, list, table

# vector
v1 <- c(12, 1, 5, 4)
v1

# access value vector
# index di mulai dari 1
v1[0]
v1[1]

# matrix
mtx1 <- matrix(c(1:10)) # masukin data dari 1-10
mtx1

mtx2 <- matrix(c(1:10), nrow = 2, ncol = 5) 
mtx2

mtx3 <- matrix(c(1:10), nrow = 2, ncol = 5, byrow = TRUE) 
mtx3

mtx4 <- matrix(c(1:10), nrow = 2, ncol = 5, byrow = TRUE, dimnames = list(c('row1','row2'), c('col1','col2','col3','col4','col5'))) 
mtx4

# access value matrix
# nama_matrix[baris-k, kolom-k]
mtx4[2, 3]

# ambil semua nilai row yang berada di kolom 4
mtx4[,4]

# ambil semua kolom pada row 1
mtx4[1,]

# function1
f1 <- function(){
  "Hello"
}

f1()

# function2
f2 <- function(x,y){
  a <<- x + y
}
f2(1,5)
a

# import data csv
score <- read.csv('Score.csv', fileEncoding = "UTF-8-BOM")
score

scoreWeight <- read.csv('ScoreWeight.csv', fileEncoding = "UTF-8-BOM")
scoreWeight

# filter course code sesuai dengan library
scoreWeight <- scoreWeight[scoreWeight$Course.Code %in% score$Course.Code, ] # pak $ berarti ngambil kolomnya
score
scoreWeight


# perkalian matrix
%*%