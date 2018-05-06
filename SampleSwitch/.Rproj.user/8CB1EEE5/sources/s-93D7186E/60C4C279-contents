ui <- tabPanel("Sample Switch",
               fluidRow(column(3, 
                               wellPanel(
      # Title ----
      titlePanel("Uploading Files"),
      # Input: Select a file ----
      fileInput("file1", "Choose retained variant table", multiple = F),
      
      # Horizontal line ----
      tags$hr(),
      # Input: Maxium Distance Allowed ----
      sliderInput("offset", "Maxium Distance Allowed:",
                  min = 1, max = 20, value = 10
      )
      )),
    column(9,
    # Main panel for displaying outputs ----
    tabsetPanel(
    # Output: Data file ----
      tabPanel("Table", dataTableOutput("ss_data")),
      tabPanel("Plot",  plotOutput("ss_plot"))
    )
    )
))
