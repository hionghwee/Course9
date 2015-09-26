---
title       : Shiny App for evaluating stock on Bullish/Bearish signal through moving averages
subtitle    : 
author      : Hiong Hwee
job         : Coursera Data Science Student
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Introduction (Slide 2/5)

<p>This presentation is demonstrate the usage of Shiny App to generate stock signal and make you a sucessful investor!</p>

<p>Moving averages (division of stock price over time periods by the number of time periods) can be used as indicators for stock prediction. </p>

We will be using the cross over of a shorter moving average to a longer moving average to determine buying (bullish) and selling (bearish) signals.

--- .class #id 

## Screenshot of the Shiny App (Slide 3/5)

This is how the Shiny App looks like and can be found on https://hionghwee.shinyapps.io/stock.

<div style='text-align: center;'>
<img height='500' width='1000' src='./assets/img/Course9.jpg' />
</div>


--- .class #id 


## Example Plot - non-interactive (Slide 4/5)
<p>Example plot of the app (non-interactive) with Apple stock data from Yahoo Finance and moving averages of 3 and 15 days. </p>

Check out the Shiny App for other stock charts or moving average indicators to get your winning stock signal formula!

```r
library(quantmod); options(getSymbols.warning4.0=FALSE)
data <- getSymbols("AAPL", src = "yahoo", from = "2015-06-01",to = "2015-09-26", auto.assign = FALSE)
chartSeries(data, theme = chartTheme("white"), name = "Stock evaluation", type = "candlesticks", TA= "addSMA(n=3);addSMA(n=15)")
```

![plot of chunk unnamed-chunk-1](assets/fig/unnamed-chunk-1-1.png) 

--- .class #id 


## Conclusion (Slide 5/5)

<p>The App is versatile and you can choose the stock symbol, the time period , and the moving averages you want to evaluate. </p>

<p>The Main Panel of the App will show based on the the moving averages for the latest day (second time period you have chosen), whether to buy or sell the stock. </p>

<p>If the 1st (shorter) moving average is higher than the 2nd (longer) moving average, it is a buy signal and vice-versa.</p>

<p>Thank you for considering this Shiny App and hope you find the winning investment strategy through it. </p>

In investing as always, do remember that past performance does not necessarily predict future results!

--- .class #id 
