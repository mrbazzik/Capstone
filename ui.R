library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predicting next word"),
    sidebarPanel(
        textInput('phrase', 'Your input'),
        actionButton("predict", "Predict")
        
    ),
    mainPanel(
            h3("Next word"),
            verbatimTextOutput("prediction")
            
)))