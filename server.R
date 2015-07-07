library(shiny)
library(RSA)
library(dplyr)
interaction <- read.csv("inter_plot.csv")[-1]
fs <- read.csv("factor_scores.csv")[-1]
shinyServer(function(input, output) {
  
  interp <- reactive({
    Value <- input$value
    Outcome <- input$outcome
    
    # Apply filters
    temp <- interaction %>%
      filter(
        predictor == Value,
        outcome == Outcome)
    
    temp <- data.frame(temp)
    temp
    
  })
  
  selectedData <- reactive({
   fs[,c(input$value, "self_concept", "none")]
  })
  
  output$plot1 <- renderPlot({
    temp1 <- isolate(interp())
    
    xy <- temp1[(temp1$type == "interaction"),c("effect")]
    x <- temp1[(temp1$type == "Value"), c("effect")]
    y <- temp1[(temp1$type == "SC"), c("effect")]
    
    xlab_name <- paste0(input$value, "(SD)")
    zlab_name <- paste0(input$outcome, "(SD)")
    
    
    plotRSA(xy = xy, x = x, y = y, type="3d", showSP=FALSE, axes="",
            xlim=c(-1.5,1.5),ylim=c(-1.5,1.5),zlim=c(-1.5,1.5),
            bw = FALSE,project = FALSE, border = TRUE, param = FALSE,
            points = list(data = selectedData(), show = T, value = "predict", jitter
                     = 0.005, color = "black", cex = 0.2, out.mark = FALSE),
            xlab = xlab_name, ylab = "Math self-concept (SD)", 
            zlab = zlab_name, legend = FALSE)
  })

  
  output$sc <- renderText({
    paste0(interp()[(interp()$type == "SC"), c("effect")],"(", 
           interp()[(interp()$type == "SC"), c("effect_se")], ")")
})

output$va <- renderText({
  paste0(interp()[(interp()$type == "Value"), c("effect")],"(", 
         interp()[(interp()$type == "Value"), c("effect_se")], ")")
})

output$inter <- renderText({
  paste0(interp()[(interp()$type == "interaction"), c("effect")],"(", 
         interp()[(interp()$type == "interaction"), c("effect_se")], ")")
})
})