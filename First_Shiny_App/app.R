#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Quick Stats Analysis"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            currentyear <- 2021,
            selectInput("var_year", "Year:",
                        c(currentyear, currentyear - 1, currentyear - 2, currentyear - 3, currentyear - 4, currentyear - 5, currentyear - 6)
                        
                        
                        )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           
        )
    )
)

# Define server logic required to draw a histogram
server <- function(input, output) {

    
    
}

# Run the application 
shinyApp(ui = ui, server = server)
