library(shiny)


# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  # Compute the forumla text in a reactive expression since it is 
  # shared by the output$caption and output$mpgPlot expressions
  data <- reactive({
    rbinom(input$x,input$N,input$p)
    
  })
  
  output$plot <- renderPlot({
   
    n <- input$N
    p<- input$p
    x<-input$x
    
    hist(data(), 
         main=paste('N = ', n, ',','p =',p, sep=''),xlab = "data",freq=FALSE,col='skyblue',breaks=20)
    if (input$normal == TRUE){
      curve(dnorm(x,mean=n*p,sd = sqrt(n*p*(1-p))),add=TRUE)
    }
  })
  
  # Generate a plot of the requested variable against mpg and only 
  # include outliers if requested
  output$summary <- renderPrint({
    summary(data())
  })
  
  
  # Generate an HTML table view of the data
  output$table <- renderTable({
    data.frame(x=data())
  })
})
