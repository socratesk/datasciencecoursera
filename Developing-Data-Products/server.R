library(datasets)
data(mtcars)
linearModel <- lm(mpg ~  wt + cyl + disp + hp + am, data = mtcars)

calculateLM <- function(wt=wt, cyl=cyl, disp=disp, hp=hp, am=am) {
  df <- data.frame(wt=wt, cyl=cyl, disp=disp, hp=hp, am=as.numeric(am))
  predict(linearModel, newdata=df)
}

shinyServer(
    function(input, output) {
    
      output$wtIn <- renderText({ paste("Car Weight:", (input$wt * 1000), "lbs")})  
      output$cylIn <- renderText({ paste("Number of Cylinders:", input$cyl)})
      output$dispIn <- renderText({ paste("Cylinder Displacement:", input$disp, "Cu. In")})
      output$hpIn <- renderText({ paste("Engine Gross Horsepower:", input$hp,"Hp")})
    
      output$amIn <- renderText({ 
        paste("Transmission:", 
          if (input$am == 0) "Automatic"
          else "Manual"
        )
      })
            
      mpgOutput <- eventReactive(input$goButton, {isolate(calculateLM(input$wt, input$cyl, input$disp, input$hp, input$am))}) 
      output$MPGout <- renderText({ paste(round(mpgOutput(), 3), "MPG")})
            
  }
)