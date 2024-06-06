# read csv
general_data <- read.csv('general_data.csv', fileEncoding = 'UTF-8-BOM')
na.omit(general_data)

# ambil manager

# 1. Show top 3 monthly income for job role manager
manager_data <- general_data[general_data$JobRole == 'Manager', ]

manager_data <- manager_data[order(manager_data$MonthlyIncome, decreasing = TRUE), ]

manager_data <- manager_data[, c('JobRole', 'MonthlyIncome')]

manager_data <- manager_data[!duplicated(manager_data$MonthlyIncome), ]

top_manager <- manager_data[1:3,]

pie(top_manager$MonthlyIncome, labels = top_manager$MonthlyIncome)

# 2. Show frequency gender office 'general_data'
male_data <- general_data[general_data$Gender == 'Male', ]
female_data <- general_data[general_data$Gender == 'Female', ]

male_total <- nrow(male_data)
female_total <- nrow(female_data)
barplot(c(male_total, female_total), names.arg = c('Male', 'Female'))

# 3. Get the type level of the job, 1 for ease, 2 for medium, 3 for hard, then make pie chart
ease_data <- general_data[general_data$JobLevel == 1, ]
medium_data <- general_data[general_data$JobLevel == 2, ]
hard_data <- general_data[general_data$JobLevel == 3, ]

ease_data$JobLevel <- 'easy'
medium_data$JobLevel <- 'medium'
hard_data$JobLevel <- 'hard'

total_ease <- nrow(ease_data)
total_medium <- nrow(medium_data)
total_hard <- nrow(hard_data)

pie(c(total_ease, total_medium, total_hard), labels = c('easy', 'medium', 'hard'))

# 4. Get the type of YearsAtCompany 1-3 as NewBie, 4-6 as Senior, 7-20 as veteran than make the abr plot for each type
newbie_data <- general_data[(general_data$YearsAtCompany >= 1 & general_data$YearsAtCompany <= 3), ]
senior_data <- general_data[(general_data$YearsAtCompany >= 4 & general_data$YearsAtCompany <= 6), ]
veteran_data <- general_data[(general_data$YearsAtCompany >= 7 & general_data$YearsAtCompany <= 20), ]

total_newbie <- nrow(newbie_data)
total_senior <- nrow(senior_data)
total_veteran <- nrow(veteran_data)

barplot(c(total_newbie, total_senior, total_veteran), names.arg = c('NewBie', 'Senior', 'Veteran'), main = 'Employee Category')
