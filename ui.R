library(shiny)

  shinyUI(fluidPage(
    

    
    fluidRow(
      
      column(12,
             titlePanel("Math Expectancy X Value on Educaitonal Outcomes"),
             
             plotOutput("plot1","100%","500px")
      ),
    column(4, 
      radioButtons('value', 'value facets', 
                  c("Intrinsic","Attainment","Utility","Cost",
                    "Achievement_AV","Personal_AV","School_UV",
                    "Daily_life_UV","Social_UV","Job_UV",
                    "Future_life_UV","Low_effort_cost","Low_emotion_cost","Low_opportunity_cost"), 
                  selected = "Intrinsic")
    ),
    column(4,
      radioButtons('outcome', 'outcome variables', c("Math achievement", "Self-reported effect", 
                   "Teacher-rated school engagement", "Teacher-rated effect"),
                  selected="Math achievement")
    ),
    column(4,
           h4('Path coefficients(S.E.)'),
           p('Effect of self-concept'),
           textOutput("sc"),
           p('Effect of value beliefs'),
           textOutput("va"),
           p('Efffect of interaction'),
           textOutput("inter"))
  )
))