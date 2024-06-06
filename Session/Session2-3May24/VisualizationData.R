vehicle <- c('a', 'b', 'c', 'd', 'e')
fuel <- c(10, 11, 20, 25, 30)

# barplot
barplot(height = fuel, width = 2, main = "fuel data")

# barplot
barplot(height = fuel, names.arg = vehicle, main = "fuel data")

# piechart
pie(fuel, labels = vehicle)
pie(fuel, labels = fuel)
pie(fuel, labels = fuel, col = rainbow(5))

#piechart percent
piepercent <- round(fuel*100/sum(fuel), 1)
piepercent
pie(fuel, labels = piepercent, col = rainbow(5), radius = 1)
legend('topleft', vehicle, fill = rainbow(length(fuel)), cex = 0.4)

# histogram
hist(fuel, main = "Histogram of fuel", xlab = "fuel", ylab = "freq", col = "pink", border = "blue")

# line graph
# type
# -> l
# -> p
# -> o
plot(fuel, type = 'o', main = "line plot", xlab = "vehicle", ylab = "fuel", col = "pink")

# boxplot
boxplot(fuel, main = "fuel data", col = "green", ylab = "fuel value")