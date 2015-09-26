# server.R

library(quantmod)


shinyServer(function(input, output) {
  
  data <- reactive({  
    getSymbols(input$symb, src = "yahoo", 
               from = input$dates[1],
               to = input$dates[2],
               auto.assign = FALSE)
  })
  
 SMA1 <- reactive({ tail(SMA(data()[,6],input$MA[1]))
 }) 
 SMA2 <- reactive({ tail(SMA(data()[,6],input$MA[2]))
})
 
  output$StockPlot <- renderPlot({
    chartSeries(data(), theme = chartTheme("white"), 
                name = "Stock evaluation", 
                  type = "candlesticks",  TA = NULL)
    addSMA(n=c(input$MA[1],input$MA[2]), col=c("blue",col="green"))
  })
  
  output$text1 <- renderText({ 
    paste("You have selected Moving Averages", input$MA[1], "and",input$MA[2], ". On",input$dates[2], "based on that, we are")
  })  

  output$text2 <-renderText({
    if (SMA1() > SMA2()){ 
      paste("bullish on this stock as the first moving average is higher than the second.")}
    
    else{paste("bearish on this stock as the first moving average is lower than the second.")
    }
  })

})