# Read csv
general_data = read.csv("general_data.csv", fileEncoding = "UTF-8-BOM")
general_data = na.omit(general_data)

# 1. show top 3 mothly income for job role manager and show piechart
manager_data = general_data[general_data$JobRole == "Manager", ]
manager_data = manager_data[, c("JobRole", "MonthlyIncome")]
manager_data = manager_data[order(manager_data$MonthlyIncome, decreasing = TRUE), ]
manager_data = manager_data[!duplicated(manager_data$MonthlyIncome), ]
top_manager = manager_data[1:3, ]

pie(top_manager$MonthlyIncome, labels = top_manager$MonthlyIncome)

# 2. show frequency gender of office general_data
male_total = nrow(general_data[general_data$Gender == "Male", ])
female_total = nrow(general_data[general_data$Gender == "Female", ])

barplot(c(male_total, female_total), names.arg = c("Male", "Female"))

# 3. get the type level of the job, 1 for ease, 2 for medium, 3 or hard, then make pie chart
ease_data = general_data[general_data$JobLevel == 1, ]
medium_data = general_data[general_data$JobLevel == 2, ]
hard_data = general_data[general_data$JobLevel == 3, ]

ease_data$JobLevel = "ease"
medium_data$JobLevel = "medium"
hard_data$JobLevel = "hard"

ease_total = nrow(ease_data)
medium_total = nrow(medium_data)
hard_total = nrow(hard_data)

pie(c(ease_total, medium_total, hard_total), label = c("ease", "medium", "hard"))

# 4. get the type of YearsAtCompany 1 - 3 as NeBie, 4 - 6 as Senior, 7 - 20 as veteran then make a barplot

newbie = general_data[general_data$YearsAtCompany >= 1 & general_data$YearsAtCompany <= 3, ]
senior = general_data[general_data$YearsAtCompany >= 4 & general_data$YearsAtCompany <= 6, ]
veteran = general_data[general_data$YearsAtCompany >= 7 & general_data$YearsAtCompany <= 20, ]

newbie_total = nrow(newbie)
senior_total = nrow(senior)
veteran_total = nrow(veteran)

barplot(c(newbie_total, senior_total, veteran_total), names.arg = c("newbie", "senior", "veteran"))

#5. Make apriori for JobRole that has work life balance, with support 0.005 and confidence
employee_data = read.csv("employee_survey_data.csv", na.strings = "NA", fileEncoding = "UTF-8-BOM")
employee_data = na.omit(employee_data)

merge_data = merge(general_data, employee_data, by = "EmployeeID")
merge_data = merge_data[, c("EmployeeID", "JobRole", "WorkLifeBalance")]
merge_data = merge_data[!duplicated(merge_data), ]

merge_data$EmployeeID = as.factor(merge_data$EmployeeID)
merge_data$JobRole = as.factor(merge_data$JobRole)
merge_data$WorkLifeBalance = as.factor(merge_data$WorkLifeBalance)

merge_data$EmployeeID = droplevels(merge_data$EmployeeID)
merge_data$JobRole = droplevels(merge_data$JobRole)
merge_data$WorkLifeBalance = droplevels(merge_data$WorkLifeBalance)

library(arules)

WorkLifeBalance = split(merge_data$JobRole, merge_data$WorkLifeBalance)