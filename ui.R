library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Binomial demo"),
  
  sidebarPanel(
  sliderInput("p", "Probability:", 
                min=0, max=1, value=0.5, step = 0.05),
  
  
  
    sliderInput("N", "Number of Trials", 
                min=1, max=100, value=1),
    
  
  
  sliderInput("x", 
              "Number of observations:", 
              value = 500,
              min = 1, 
              max = 1000),
  
  checkboxInput("normal", "Overlay Normal distribution", FALSE)
    
  
  ),

  


  mainPanel(
    tabsetPanel(
      tabPanel("Plot", plotOutput("plot")), 
      tabPanel("Summary", verbatimTextOutput("summary")), 
      tabPanel("Table", tableOutput("table"))
    )
  )
))
