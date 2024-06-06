ScoreData = read.csv("Score.csv", na.strings = "", fileEncoding = "UTF-8-BOM")
CourseData = read.csv("Course.csv")

ScoreData = na.omit(ScoreData) 

# Indexing
ScoreData = ScoreData[
  ScoreData$Score <= 100 & ScoreData$Score >= 0,
]

# Subset
ScoreData = subset(ScoreData, ScoreData$Score <= 100 & ScoreData$Score >= 0)

# buat cari data duplikat di mana terus dibalikinnya pake TRUE or FALSE, 
# ngeceknya semua kolom dalam 1 row
duplicated(ScoreData) 

# remove duplikat data
ScoreData = ScoreData[!duplicated(ScoreData),]

# merge -> join dua data
MergedData = merge(ScoreData, CourseData, by = "Course.Code")

# kalo misal ada 2 score data, kan namanya beda course id sama course name nah itu kalian bisa tentuin yang mana mau duluan pake by.x = "" sama by.y = ""

# function yang bisa dipake
mean(MergedData$Score)
sum(MergedData$Score)
length(MergedData$Score)
median(MergedData$Score)
sd(MergedData$Score)
summary(MergedData)

# Top 3 Student Average Score
studentAvg = aggregate(ScoreData$Score, by=list(ScoreData$Name), FUN = mean)
colnames(studentAvg) = c("Student", "Avg.Score")

studentAvg = studentAvg[order(studentAvg$Avg.Score, decreasing = TRUE),]

studentAvg[c(1:3),]
head(studentAvg, 3)

# Total Student per Couse for student score >= 65
# Course Code     Total Student

filterStudent = ScoreData[ScoreData$Score >= 65,]
totalStudent = aggregate(
  filterStudent$Name,
  by=list(filterStudent$Course.Code),
  FUN = length
)

# Subject               Total Student
# Coursecode-coursename
filterStudent2 = MergedData[MergedData$Score >= 65,]
filterStudent2$Subject = paste(
  filterStudent2$Course.Code, 
  filterStudent2$Course.Name,
  sep = "-"
)
totalStudent2 = aggregate(
  filterStudent2$Name,
  by=list(filterStudent2$Subject),
  FUN = length
)

colnames(totalStudent2) = c("Subject", "Total.Student")

# Total Income For Each Course, 1 Credit = 500000
TotalIncome = MergedData
TotalIncome$Income = MergedData$Credit * 500000
TotalIncome = aggregate(TotalIncome$Income, 
                        by=list(TotalIncome$Course.Code),
                        FUN = sum)

colnames(TotalIncome) = c("Course.Code", "Income")