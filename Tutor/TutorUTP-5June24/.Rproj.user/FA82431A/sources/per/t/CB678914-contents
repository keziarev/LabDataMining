# 1
rate = read.csv("Exchange Rate.csv", fileEncoding = "UTF-8-BOM")
rate

# 2
btc = rate[rate$Cryptocurrency == "BTC", ]
eth = rate[rate$Cryptocurrency == "ETH", ]
xrp = rate[rate$Cryptocurrency == "XRP", ]

btc = btc[order(btc$Date, btc$Time, decreasing = FALSE), ]
eth = eth[order(eth$Date, eth$Time, decreasing = FALSE), ]
xrp = xrp[order(xrp$Date, xrp$Time, decreasing = FALSE), ]

# 3 
eth16 = eth[eth$Date == "16-Aug-18",]
eth16
open = head(eth16, 1)
close = tail(eth16, 1)
open
close
sprintf("Etherium 16 August Open Price: Rp. %s", open$Price)
sprintf("Etherium 16 August Open Price: Rp. %s", close$Price)

# 4
btc15 = btc[btc$Date == "15-Aug-18", ]
btc15
btc15[order(btc15$Price), ]
btc15
#low = tail(btc15, 1)
#high = head(btc15, 1)
low = min(btc15$Price)
high = max(btc15$Price)
#sprintf("Bitcoin 15 August High Price: Rp. %s", high$Price)
#sprintf("Bitcoin 15 August Low Price: Rp. %s", low$Price)
sprintf("Bitcoin 15 August High Price: Rp. %s", high)
sprintf("Bitcoin 15 August Low Price: Rp. %s", low)

# 5
xrp18 = xrp[xrp$Date == "18-Aug-18", ]
xrp18
summary(xrp18)
xrp18$Harga = as.double(xrp18$Price)*1000
xrp18

average = mean(xrp18$Harga)
average = formatC(average, format = "f", big.mark = ".", decimal.mark = ",", digits = 3)
average

median = median(xrp18$Harga)
median = formatC(median, format = "f", big.mark = ".", decimal.mark = ",", digits = 1)
median

sd = sd(xrp18$Harga)
sd = formatC(sd, format = "f", big.mark = ".", decimal.mark = ",", digits = 5)
sd

sprintf("Ripple 18 August Average Price: Rp. %s", average)
sprintf("Ripple 18 August Average Price: Rp. %s", median)
sprintf("Ripple 18 August Average Price: Rp. %s", sd)
