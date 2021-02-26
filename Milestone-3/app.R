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
ui <- navbarPage(
    "Final Project Title",
    tabPanel("Model",
             fluidPage(
                 titlePanel("Model Title"),
                 sidebarLayout(
                     sidebarPanel(
                         selectInput(
                             "plot_type",
                             "Plot Type",
                             c("Option A" = "a", "Option B" = "b")
                         )),
                     mainPanel(plotOutput("line_plot")))
             )),
    tabPanel("Discussion",
             titlePanel("Discussion Title"),
             p("Tour of the modeling choices you made and 
              an explanation of why you made them")),
    tabPanel("About", 
             titlePanel("About"),
             h3("Project Background and Motivations"),
             p("Hello, this is where I talk about my project."),
             p("I am using the World Value Survey (WVS) dataset which asks people from various countries about their values,
               and world views. I will focus on 4 main questions related to life satisfaction, 
               happiness and family, and compare the results between different countries"),
             p("For an additional data set- I am searching data about Israel which is missing
               in the WVS dataset."),
             p("A third dataset I am thinking of using is world happiness report from 2019,
               which examins happiness compared to GDP per capita in different counties."),
             p(tags$a(href = "https://www.kaggle.com/unsdsn/world-happiness?select=2019.csv", "World Happiness Report")),
             h3("About Me"),
             p("My name is Shaked and I study Neuroscience. 
             You can reach me at shakedleibovitz@college.harvard.edu."),
             p(tags$a(href = "https://github.com/Shakedi/gov1005-milestone-3", "connect to Github-milestone-3"))))


# Define server logic required to draw a histogram
server <- function(input, output) {}

# Run the application 
shinyApp(ui = ui, server = server)
