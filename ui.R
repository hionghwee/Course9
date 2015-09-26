shinyUI(fluidPage(
  titlePanel("Stock Evaluation using 2 Moving Averages"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Input stock symbol to evaluate (e.g. Apple - 'AAPL', Honeywell - 'HON'. 
        Stock data will be extracted from Yahoo Finance"),
      textInput("symb", "Symbol", "AAPL"),
      
      helpText("Input date range for stock evaluation"),
      dateRangeInput("dates", 
        "Date range",
        start = "2015-06-01", 
        end = as.character(Sys.Date())),

      helpText("
      Select the Moving Averages to evaluate the stock trend (cross over of moving averages). 
               1st number in blue, 2nd in green."),
      sliderInput("MA", "Moving Averages Slider",
                  min = 1, max = 100, value = c(3, 15)),
		  helpText("NOTE: Reactive Output - Changing the moving averages will have server calculate the MA lines without fresh download of stock data.")
    ),
    
    mainPanel(
      plotOutput("StockPlot"),
      textOutput('text1'),
      textOutput('text2')    
              
              
    )
  )
))