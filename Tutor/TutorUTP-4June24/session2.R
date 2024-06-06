vehicle<-c("a","b","c","d","e")
fuel <- c(10,11,20,25,30)
date = c("25-10,2004", "26-10-2004", "27-10-2004", "28-10-2004", "29-10-2004")

barplot(fuel, names.arg = vehicle, main="Fuel Consumption of Vehicle", col = rainbow(length(fuel))) # rainbow itu bakal kasi warna beda beda, bisa lagnsung tembak mau berapa warna ato pake length(fuel) nanti dia kasi warna sesuai jumlah data kita
pie(fuel, labels=fuel)
percentage = round(fuel*100/sum(fuel), 2)
pie(percentage, labels = percentage)
pie(percentage, labels = paste(percentage, " %"), main="Fuel Consumption of Vehicle", col = rainbow(5))
legend("topright", vehicle, fill = rainbow(5))

hist(fuel, xlab = "Fuel Consumption", ylab = "Freq")

boxplot(fuel, ylab = "freq", col = "pink")

plot(fuel, type="o", col="red", xlab = "vehicle", ylab = "freq", xaxt = "n")
axis(1, at=1:5, date)