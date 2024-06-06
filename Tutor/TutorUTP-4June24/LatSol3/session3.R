# Read
# Liat csv, NA nya dalam bentuk apa
score = read.csv("Score.csv", na.strings = "", fileEncoding = "UTF-8-BOM")
course = read.csv("Course.csv", fileEncoding = "UTF-8-BOM")

# Hapus yang NA
score = na.omit(score)

# Ambil yang datanya cuma 0-100
score = score[score$Score <= 100 & score$Score >= 0,]

# Hapus duplicate
duplicated(score)
score = score[!duplicated(score),]
duplicated(score)

# Merged
merged = merge(score, course, by = "Course.Code")
merged

#Top 3 Student Average Score for all 
average = aggregate(merged$Score, by = list(merged$Name), FUN = mean)
average = average[order(average$x, decreasing = TRUE), ]
average
top = head(average, 3)
top

#total student per course for student >=65
up65 = score[score$Score >= 65, ]
up65
count = aggregate(up65$Name, by = list(up65$Course.Code), FUN = length)
colnames(count) = c("Course.Code", "Score")
finl = merge(count, course, "Course.Code")
finl

#Total Income For Each Course, 1 Credit = 500000
finl$Income = finl$Score*finl$Credit*500000
finl