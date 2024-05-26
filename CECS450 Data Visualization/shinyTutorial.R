library(shiny)
library(bslib)


ui <- fluidPage(
  titlePanel("BC Liquor Store Prices", window = "cs450 Week 11"),
  
  sidebarLayout(
    sidebarPanel(sliderInput("priceInput"),"Price", min = 0, max = 100, value = c(10, 20), pre = "$"),
    radioButtons("typeInput", "Product type", choices = c("Beer", "Refreshment", "Refreshment","Spirits", "Wine"), selected = "WINE"),
    selectInput("countryInput", "Country", choices = c("Canada", "France", "Italy"))),
  
    mainPanel(plotOutput("coolplot"),
              tableOutput("results"),
              textOutput("nrow"))
              )
 )
server <- function(input, output) {
  output$coolplot <- renderPlot((
    filtered<-
      bcl %>%
      filter(Price >= input$priceInput[1],
             Price <= input$priceInput[2],
             Type == input$typeInput,
             Country == input$countryInput
    ggplot(filtered, aes(Alchohol_Content)) +
      geom_histogram()
  ))
}
shinyApp(ui=ui, server=server)
