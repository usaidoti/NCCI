 
library(shiny)
library(rsconnect)
library(ggplot2)
library(stringr)
library(DT)
library(scales)

NCCIbind<-data.frame(NCCIbind)
 
server<-function(input, output) {
  
  # Compute the forumla text in a reactive expression since it is
  # shared by the output$caption and output$Plot expressions
  formulaText <- reactive({
    paste("Résumé du champ pour", input$variable)
  })
  
  # Return the formula text for printing as a caption
  output$caption <- renderText({
    formulaText()
  })
  
  # Generate a plot of the requested variable - ggplot version
  output$Plot <- renderPlot({
    
    # check for the input variable
    if (input$variable == "Q1") {
      # Q1
      NCCIbind <- data.frame(Q1 = NCCIbind$Q1, var = factor(NCCIbind[[input$variable]]))
    }
    else {
      # Other questions
      NCCIbind <- data.frame(Q1 = NCCIbind$Q1, var = factor(NCCIbind[[input$variable]]))
    }
    
    p <- ggplot(NCCIbind, aes(var)) +
      geom_bar(aes(y = (..count..)/sum(..count..)), fill="slateblue")+
      xlab("") + ylab("Percent")+scale_x_discrete(labels = function(x) str_wrap(x, width = 25)) +
      scale_y_continuous(labels=percent)
    print(p)
  
  })
  # Generate an HTML table view of the data
  output$table <- DT::renderDataTable({
    DT::datatable(NCCIbind, options = list(orderClasses = TRUE, pageLength = 25))
  })
  output$downloadData <- downloadHandler(
    filename = function() { paste('NCCIexport-', Sys.Date(), '.csv', sep='') },
    content = function(file) {
      write.csv(NCCIbind, file)
    }
  )
  output$summary <- renderPrint({

    length(NCCIbind$Q8)
  })
  
}
ui<-pageWithSidebar(
  
  # Application title
  headerPanel("NCCI Hotline"),
  
  # Sidebar with controls to select the variable 
  
  sidebarPanel(
    selectInput("variable", "Survey Questions:",
                list("1. Dans quelle langue vous sentez-vous le plus à l’aise pour communiquer?" = "Q1", 
                     "2. Dans quelle région habitez-vous actuellement ?" = "Q2", 
                     "3. Indiquez si l’appelant est un homme ou une femme" = "Q8",
                     "4. A quel groupe ethnique appartenez-vous?" = "Q9",
                     "5. Age" = "Q7bin",
                     "6. Avez-vous participé, organisé, ou vous sentez vous concerné en tant que membre de la communauté par le concours scolaire pour la cohésion sociale?"="Q10LN",
                     "7. Comment avez-vous entendu parler de la ligne téléphonique/hotline?"="Q41.1."
                     )), 
   
    downloadButton('downloadData', 'Download data')
  ),
  
  # Show the caption and plot of the requested variable
  mainPanel(
    h3(textOutput("caption")),
    tabsetPanel(type="tabs",
    tabPanel("Plot", plotOutput("Plot"),
             h4("Summary"),
             verbatimTextOutput("summary")),
    tabPanel("Table", DT::dataTableOutput("table"))
  )
))

shinyApp(ui = ui, server = server)
