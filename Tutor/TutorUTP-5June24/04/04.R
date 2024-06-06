install.packages("arules")
library(arules)

games = read.csv('Games.csv', na.strings = 'N/A', fileEncoding = 'UTF-8-BOM')
games = na.omit(games)

detail = read.csv('Detail.csv', na.strings = '', fileEncoding = 'UTF-8-BOM')
detail = na.omit(detail)

header = read.csv('Header.csv', na.strings = '', fileEncoding = 'UTF-8-BOM')
header = na.omit(header)

data = merge(header, detail, by = 'TransactionId')
data = merge(data, games, by = 'GameId')
data

data$Name = as.factor(data$Name)
data$TransactionId = as.factor(data$TransactionId)

data$Name = droplevels(data$Name)
data$TransactionId = droplevels(data$TransactionId)

library('arules')

datas = split(data$Name, data$TransactionId)

rules = apriori(datas, 
                parameter = list(maxlen = 10, support = 0.005, target = 'frequent itemsets')
                )
inspect(rules)

inspect(ruleInduction(rules, confidence = 0.15)) 