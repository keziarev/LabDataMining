# 1. Import CSV dan kolomnya cuma Invoice ID, Branch, City, Gender, Unit Price, dan Quantity
sales = read.csv("supermarket_sales.csv", fileEncoding = "UTF-8-BOM")
sales = subset(sales, select = c("Invoice.ID", "Branch", "City", "Gender", "Unit.price", "Quantity"))
sales = sales[,c("Invoice.ID", "Branch", "City", "Gender", "Unit.price", "Quantity")]

# 2. Ambil data yang Branchnya cuma Naypyitaw dan Yangon doang
sales = sales[sales$City == "Naypyitaw" | sales$City == "Yangon",]

# 3. Buat kolom total pembelian
sales$Total = sales$Unit.price*sales$Quantity

# 4. Update gender dimana Male diubah jadi M, dan Female jadi F
sales$Gender[sales$Gender == "Male"] = "M"
sales$Gender[sales$Gender == "Female"] = "F"
sales

# 5. Sort data dari total Harga terbesar ke terkecil
sales = sales[order(sales$Total, decreasing = TRUE),]
sales

# 6. Ambil 10 data teratas
sales[1:10,]
head(sales, 10)


# 7. Buat plot dari 10 data teratas
barplot(head(sales$Total, 10), names.arg = head(sales$Invoice.ID, 10), col = rainbow(10))