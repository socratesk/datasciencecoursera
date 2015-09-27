library(shiny)

shinyUI (pageWithSidebar(
  # Application Title
  headerPanel(h1('Interactive Car Mileage Prediction', align = "center")),
 
  sidebarPanel(
   
    h3(p("Enter Car Specification")),
    
    numericInput("wt", "Car Weight (in lbs/1000):", 3.325, min=1.5, max=6, step=0.001),
    numericInput("cyl", "Number of Cylinders (4/6/8):", 6, min=4, max=8, step=2),
    numericInput("disp", "Cylinder Displacement  (Cu. In):", 196.3, min=70, max=472, step=0.1),
    numericInput("hp", "Engine Gross Horsepower (Hp):", 123, min=50, max=350, step=0.1),
    
    radioButtons("am", "Type of Transmission:",
                 c("Automatic" = "0", "Manual" = "1"), selected = "0"),
    
    actionButton('goButton', 'Calculate MPG')
  ),
  
  mainPanel(
    
    h4("Socrates Krishnamurthy"),
    p(
      paste("This project is submitted as partial fulfillment of requirements of 'Developing Data Products' course",
            "- part of Data Science curriculum by John Hopkins University. In this project, a dataset containing the key features and ",
            " performance factors of various cars - provided by 'Motor Trends Magazine' - are used as reference to calculate the mileage of a given car."), style = "font-family: 'times'; color:blue; font-size: 14pt"
    ),
    p(
      paste( 
            "A 'Linear Model' is developed based on the data available in 'mtcars' dataset using 'wt + cyl + disp + hp + am' as predictors and ",
            "'mpg' as response variable. This model is later used to calculate the mileage of an unknown car."), 
          style = "font-family: 'times'; color:blue; font-size: 14pt"
    ),
    p(
      paste( 
        "Enter the specification of a car (from Users Manual) whose mileage has to be calculated, in the left Sidebar panel and click ",
        "'Calculate MPG' button. Upon clicking the button, the entered values will be passed to the Linear Model developed above ",
        "and the mileage will be predicted and displayed below."), style = "font-family: 'times'; color:blue; font-size: 14pt"
    ),
    h3('Specification Provided:'),
    textOutput("wtIn"), br(),
    textOutput("cylIn"), br(),
    textOutput("dispIn"), br(),
    textOutput("hpIn"), br(),
    textOutput("amIn"), br(),
    
    h3('Details Calculated:'),
    p('Calculated Mileage'), strong(textOutput("MPGout"))
  )  
 )
)