library(shiny)
library(rsconnect)
library(ggplot2)
library(stringr)
library(DT)
library(scales)
library(plotly)

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
    if (input$variable == "Comment.Entendu") {
      # Q1
      NCCIbind <- data.frame(Comment.Entendu = NCCImelt2$Comment.Entendu, var = factor(NCCImelt2[[input$variable]]))
    }
    else {
      # Other questions
      NCCIbind <- data.frame(Language = NCCIbind$Language, var = factor(NCCIbind[[input$variable]]))
    }
    
    p <- ggplot(subset(NCCIbind, var!="NA"), aes(var)) +
      geom_bar(aes(y = (..count..)/sum(..count..)), fill="slateblue")+
      xlab("") + ylab("Percent")+scale_x_discrete(labels = function(x) str_wrap(x, width = 25)) +
      scale_y_continuous(labels=percent)
    print(p)
    
  })
  # Generate an HTML table view of the data; when updating, add links to new tables
  output$table <- DT::renderDataTable({
    DT::datatable(NCCIbind, options = list(orderClasses = TRUE, pageLength = 25))
  })
  output$downloadData <- downloadHandler(
    filename = function() { paste('NCCIexport-', Sys.Date(), '.csv', sep='') },
    content = function(file) {
      write.csv(NCCIbind, file)
    }
  )
  output$AGA041 <- downloadHandler(
    filename = function() {
      paste("AGA041-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA041, file)
    } )
  output$AGA045 <- downloadHandler(
    filename = function() {
      paste("AGA045-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA045, file)
    } )
  output$AGA046 <- downloadHandler(
    filename = function() {
      paste("AGA046-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA046, file)
    } )
  output$AGA051 <- downloadHandler(
    filename = function() {
      paste("AGA051-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA051, file)
    } )
  output$AGA055 <- downloadHandler(
    filename = function() {
      paste("AGA055-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA055, file)
    } )
  output$AGA059 <- downloadHandler(
    filename = function() {
      paste("AGA059-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA059, file)
    } )
  output$AGA060 <- downloadHandler(
    filename = function() {
      paste("AGA060-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA060, file)
    } )
  output$AGA061 <- downloadHandler(
    filename = function() {
      paste("AGA061-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA061, file)
    } )
  output$DIF010 <- downloadHandler(
    filename = function() {
      paste("DIF010-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF010, file)
    } )
  output$DIF018 <- downloadHandler(
    filename = function() {
      paste("DIF018-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF018, file)
    } )
  output$DIF044 <- downloadHandler(
    filename = function() {
      paste("DIF044-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF044, file)
    } )
  output$DIF059 <- downloadHandler(
    filename = function() {
      paste("DIF059-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF059, file)
    } )
  output$NIA029 <- downloadHandler(
    filename = function() {
      paste("NIA029-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(NIA029, file)
    } )
  output$TILL006 <- downloadHandler(
    filename = function() {
      paste("TILL006-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(TILL006, file)
    } )
  output$TILL007 <- downloadHandler(
    filename = function() {
      paste("TILL007-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(TILL007, file)
    } )
  output$TILL009 <- downloadHandler(
    filename = function() {
      paste("TILL009-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(TILL009, file)
    } )
  output$DIF040 <- downloadHandler(
    filename = function() {
      paste("DIF040-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF040, file)
    } )
  output$DIF048 <- downloadHandler(
    filename = function() {
      paste("DIF048-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF048, file)
    } )
   output$DIF045 <- downloadHandler(
    filename = function() {
      paste("DIF045-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF045, file)
    } )
       output$AGA062 <- downloadHandler(
    filename = function() {
      paste("AGA062-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA062, file)
    } )
     output$AGA031 <- downloadHandler(
    filename = function() {
      paste("AGA031-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA031, file)
    } )
       output$DIF038 <- downloadHandler(
    filename = function() {
      paste("DIF038-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(DIF038, file)
    } )
       output$CFWNM2 <- downloadHandler(
    filename = function() {
      paste("CFWNamlewaMada2-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(CFWNM2, file)
    } )
        output$TIL016 <- downloadHandler(
    filename = function() {
      paste("TIL016-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(TIl016, file)
    } )
    output$AGA066 <- downloadHandler(
    filename = function() {
      paste("AGA066-", date, ".csv", sep="")
    },
    content = function(file) {
      write.csv(AGA066, file)
    } )
    
    
  output$total <-  renderText({
    paste0(nrow(NCCIbind)) 
  })
  output$male<-renderText({paste0(sum(NCCIbind$Q8 == "M"))})
  output$female<-renderText({paste0(sum(NCCIbind$Q8 == "F"))})
}
ui<-pageWithSidebar(
  
  # Application title
  headerPanel("NCCI Hotline"),
  
  # Sidebar with controls to select the variable 
  
  sidebarPanel(
    selectInput("variable", "Survey Questions:",
                list("1. Dans quelle langue vous sentez-vous le plus à l’aise pour communiquer?" = "Language", 
                     "2. Dans quelle région habitez-vous actuellement ?" = "Region", 
                     "3. Indiquez si l’appelant est un homme ou une femme" = "Gender",
                     "4. A quel groupe ethnique appartenez-vous?" = "Ethnicity",
                     "5. Age" = "Age.Group",
                     "6. Avez-vous participé, organisé, ou vous sentez vous concerné en tant que membre de la communauté par le concours scolaire pour la cohésion 
                     sociale?"="Participation",
                     "7.  La sélection des bénéficiaires pour la participation dans ce projet a été:"="Selection.Beneficiaries",
                     "8. Comment avez-vous entendu parler de la ligne téléphonique/hotline?"="Comment.Entendu"
                
                )), 
    
    downloadButton('downloadData', 'Download data')
  ),
  
  # Main panel with plot, table and links to surveys; when updating, add new tables to bottom of list
  mainPanel(
    h3(textOutput("caption")),
    tabsetPanel(type="tabs",
                tabPanel("Plot", plotOutput("Plot"),
                         h4("Summary"),
                         paste0("Respondents: ", nrow(NCCIbind)), tags$br(),
                         paste0("Men: ", sum(NCCIbind$Gender == "M"),",  (" , signif(sum(NCCIbind$Gender == "M")/nrow(NCCIbind),digits = 4)*100,"%)"),tags$br(),
                         paste0("Women: ", sum(NCCIbind$Gender == "F"),",  (" , signif(sum(NCCIbind$Gender == "F")/nrow(NCCIbind),digits = 4)*100,"%)")
                         , tags$br(),
                         paste0("Updated: ", date,"UTC")),
                
                tabPanel("Table", DT::dataTableOutput("table")),
                tabPanel("Full Surveys", 
                         downloadLink("AGA041", "AGA041"),br(),
                         downloadLink("AGA045", "AGA045"),br(),
                         downloadLink("AGA046", "AGA046"),br(),
                         downloadLink("AGA051", "AGA051"),br(),
                         downloadLink("AGA055", "AGA055"),br(),
                         downloadLink("AGA059", "AGA059"),br(),
                         downloadLink("AGA060", "AGA060"),br(),
                         downloadLink("AGA061", "AGA061"),br(),
                         downloadLink("DIF010", "DIF010"),br(),
                         downloadLink("DIF018", "DIF018"),br(),
                         downloadLink("DIF044", "DIF044"),br(),
                         downloadLink("DIF059", "DIF059"),br(),
                         downloadLink("NIA029", "NIA029"),br(),
                         downloadLink("TILL006", "TILL006"),br(),
                         downloadLink("TILL007", "TILL007"),br(),
                         downloadLink("TILL009", "TILL009"),br(),
                         downloadLink("DIF040", "DIF040"),br(),
                         downloadLink("DIF048", "DIF048"),br(),
                        downloadLink("DIF045", "DIF045"),br(),
                        downloadLink("AGA062", "AGA062"),br(),
                        downloadLink("AGA031", "AGA031"),br(),
                        downloadLink("DIF038", "DIF038"),br(),
                         downloadLink("CFWNM2", "CFWNM2"),br(),
                        downloadLink("TIL016", "TIL016"),br(),
                         downloadLink("AGA066", "AGA066"))
    )
  ))

shinyApp(ui = ui, server = server)

 
