library(shiny)

bmi <- function(w, h)
{
  plot(c(12.5, 36), c(0, 1), type='n', asp=5, xlab='BMI', ylab='', yaxt='n', main='Body Mass Index Zones')
  rect(12.5, 0, 18.5, 1, col='white')
  text(15.5, .1, 'underweight', adj=0.5)
  rect(18.5, 0, 25, 1, col='green')
  text(21.75, .1, 'normal', adj=0.5)
  rect(25, 0, 30, 1, col='yellow')
  text(27.5, .1, 'overweight', adj=0.5)
  rect(30, 0, 36, 1, col='red')
  text(33, .1, 'obese', adj=0.5)
  
  index = w / (h / 100) ^ 2
  xcoord = index
  if (index < 12.5) xcoord = 12.5
  if (index > 36) xcoord = 36
  adj = 0
  if (xcoord > 20) adj = 1
  
  abline(v=xcoord, lwd=2, col='blue')
  text(xcoord + .3 - .6 * adj, 1.2, paste('weight: ', w, 'kg'), adj=adj)
  text(xcoord + .3 - .6 * adj, 1.1, paste('bmi: ', round(index, 1)), adj=adj)
}

shinyServer(function(input, output) {

  output$bmiPlot <- renderPlot({
    bmi(input$weight, input$height)
  })

})
