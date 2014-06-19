library(shiny)

# Define UI for application that plots random distributions 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel('Body Mass Index Calculator'),

  # Sidebar with a slider input for number of observations
  sidebarPanel(
    sliderInput('height', 
                'Your height in cantimeters:', 
                min = 140,
                max = 210, 
                value = 175),
    sliderInput('weight', 
                'Your weight in kilograms:', 
                min = 40,
                max = 120, 
                value = 75)
  ),
  
  mainPanel(
    p('The', a('body mass index (BMI)', href='http://en.wikipedia.org/wiki/Body_mass_index'),
      'is a measure of relative weight based on an individual\'s mass and height.'),
    p('Specify your weight in kilograms and height in cantimeters using sliders to calculate your BMI.'),
    p('Move sliders to find out what weight you need to be in BMI zone you want.'),
    plotOutput('bmiPlot')
  )
))