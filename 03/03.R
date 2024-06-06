# 1.	Read the CSV file and divide the data based on their cryptocurrency.

rate = read.csv("Exchange Rate.csv", fileEncoding = "UTF-8-BOM")
rate

# 2. Since the data is shuffled, order the data based on date and time in ascending order.

btc = rate[rate$Cryptocurrency == "BTC", ]
eth = rate[rate$Cryptocurrency == "ETH", ]
xrp = rate[rate$Cryptocurrency == "XRP", ]

btc = btc[order(btc$Date, btc$Time, decreasing = FALSE), ]
eth = eth[order(eth$Date, eth$Time, decreasing = FALSE), ]
xrp = xrp[order(xrp$Date, xrp$Time, decreasing = FALSE), ]

# 3.	Calculate Open and Close price of ETH (Ethereum) on 16 August.

eth16 = eth[eth$Date == "16-Aug-18",]
eth16
open = head(eth16, 1)
open
close = tail(eth16, 1)
close

sprintf("Etherium 16 August Open Price: Rp. %s", open$Price)
sprintf("Etherium 16 August Open Price: Rp. %s", close$Price)

# 4.	 Calculate High and Low price of BTC (Bitcoin) on 15 August.

btc15 = btc[btc$Date == "15-Aug-18",]
btc15
lowPrice = min(btc15$Price)
highPrice = max(btc15$Price)
lowPrice
highPrice

sprintf("Bitcoin 15 August Low Price: Rp. %s", lowPrice)
sprintf("Bitcoin 15 August High Price: Rp. %s", highPrice)

# 5.	Summarize the price of XRP (Ripple) on 18 August and calculate its Mean, Median, and Standard Deviation.

xrp18 = xrp[xrp$Date == "18-Aug-18", ]
xrp18
summaryxrp18 = summary(xrp18)
summaryxrp18
xrp18$Price = as.double(xrp18$Price)*1000
xrp18 

average = mean(xrp18$Price)
average = formatC(average, format = "f", big.mark = ".", decimal.mark = ",", digits = 3)
average

median = median(xrp18$Price)
median = formatC(median, format = "f", big.mark = ".", decimal.mark = ",", digits = 1)
median

sd = sd(xrp18$Price)
sd = formatC(sd, format = "f", big.mark = ".", decimal.mark = ",", digits = 5)
sd

sprintf("Ripple 18 August Average Price: Rp. %s", average)
sprintf("Ripple 18 August Average Price: Rp. %s", median)
sprintf("Ripple 18 August Average Price: Rp. %s", sd)


