library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Predicting next word"),
    sidebarPanel(
        textInput('phrase', 'Your input'),
        actionButton("predict", "Predict")
        
    ),
    mainPanel(
            h3("Next word"),
            h5("(there may be some noticeable delay for the first prediction)"),
            verbatimTextOutput("prediction")
            
)))