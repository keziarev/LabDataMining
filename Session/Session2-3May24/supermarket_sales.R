# import data
df <- read.csv('supermarket_sales.csv', fileEncoding = "UTF-8-BOM")
df

df <- subset(df, select = c("Invoice.ID", "Branch", "City", "Gender", "Unit.price", "Quantity"))

# filter data base city naypyitaw
df[df$City == "Naypitaw" | df$City == "Yangan"]

# total
total <- df$Unit.price * df$Quantity
total

# masukkan data total ke df
df$Total <- total
df

# update data gender menjadi F & M
gender <- df$Gender
gender[gender == 'Female'] <- 'F'
gender[gender == 'Male'] <- 'M'
gender

df$Gender <- gender
df

# sorting desc (besar ke kecil) by total price
df <- df[order(df$Total, decreasing = TRUE),]
df

# Top 10 transaction
top <- head(df, 10)
top

# menampilkan menggunakan plot
barplot(top$Total, names.arg = top$Invoice.ID, horiz = TRUE, space = 2)
barplot(top$Total, names.arg = top$Invoice.ID,)

# POINT PENTING
# ini salah satu bentuk soal dari visualisation
# tampilin visualisasi data dari top 10 transaction dari total price dari kota naypitaw sama yangan
