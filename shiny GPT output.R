library(shiny)


if (interactive()) {
  
  ui <- fluidPage(
    textInput("prompt", "Prompt", " "),
    verbatimTextOutput("value")
  )
  server <- function(input, output) {
    output$value <- output$value <- renderText({ ask_chatgpt(input$prompt) })
  }
  shinyApp(ui, server)
}
