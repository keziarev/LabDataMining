# read csv
general_data <- read.csv('general_data.csv', fileEncoding = 'UTF-8-BOM')
employee_survey_data <- read.csv('employee_survey_data.csv', fileEncoding = 'UTF-8-BOM')

# Make apriori for JobRole that has work life balance, with support 0.005 and confidence 0.15
mergeData <- merge(general_data, employee_survey_data, by='EmployeeID')

mergeData <- mergeData[, c('EmployeeID', 'JobRole', 'WorkLifeBalance')]

mergeData$EmployeeID <- as.factor(mergeData$EmployeeID)
mergeData$JobRole <- as.factor(mergeData$JobRole)
mergeData$WorkLifeBalance <- as.factor(mergeData$WorkLifeBalance)

mergeData$EmployeeID <- droplevels(mergeData$EmployeeID)
mergeData$JobRole <- droplevels(mergeData$JobRole)
mergeData$WorkLifeBalance <- droplevels(mergeData$WorkLifeBalance)

library(arules)

wlb_data <- split(mergeData$JobRole, mergeData$WorkLifeBalance)

rules <- apriori(wlb_data, parameter = list(support = 0.005, maxlen=10, target = 'Frequent itemsets'))

inspect(rules)
inspect(ruleInduction(rules, confidence = 0.15))