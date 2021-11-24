library(shiny)

# Define UI
ui <- fluidPage(
  h1("How You Doing?"),
  textInput(
            inputId = "name",
            label = "What's your name?"
  ),
  sliderInput("integer",
              "Are you bored?",
              min = 0, max = 10,
              value = 5
  ),
  p("0 being not at all and 10 being board to death"),
  radioButtons(
              inputId = "suggestion",
              label = "Want me to tell you something you can do?",
              choices = list("yes" = "1", "no" = "2"),
              selected = "2"
  ),
  h1("Hi there..."),
  textOutput(outputId = "name"),
  textOutput(outputId = "suggestion")
)


# Define server logic
server <- function(input, output) {
  output$name <- renderText({
    paste("Hiiii", input$name)
  })
  output$suggestion <- renderText({
    if(input$suggestion == 1){
      paste("You can go watch HunterXHunter on Netflix")
    } else {
      paste("Have a great day!")  
    }
  })
}


# Run the app
shinyApp(ui = ui, server = server)