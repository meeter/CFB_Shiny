ui <- tabPanel("Sample Switch",   ###Tab Name
              tabsetPanel(
                 tabPanel("Upload File",
                    # Title ----
                    #titlePanel("Uploading Files"),
                    # Input: Select a file ----
                    fluidRow(column(3, 
                            fileInput("file1", "Choose retained variant table", multiple = F),
                          # Horizontal line ----
                            tags$hr(),
                          # Input: Maxium Distance Allowed ----
                            sliderInput("offset", "Maxium Distance Allowed:", min = 1, max = 20, value = 10)
                            ),
                            column(9, dataTableOutput("ss_data"))
                          )
                    ),
                  tabPanel("Plot Chord-Diagram", 
                    fluidRow(column(3, 
                            fluidRow(column(5, tags$textarea(id="Sample1", rows=8, cols=12, "Sample1\nSample2\nSample3\nSample4\nSample5")),
                                     column(2, tags$h4(),tags$h1(),tags$h1(),tags$h1(),tags$h4("=>")),
                                     column(5, tags$textarea(id="Sample2", rows=8, cols=12, "Sample5\nSample4\nSample5\nSample2\nSample1"))),
                            fluidRow(column(5, offset=4, submitButton("Plot")))),
                            column(9,  #verbatimTextOutput("sample1"), verbatimTextOutput("sample2"),
                                   plotOutput("ss_plot"))
                            )
                          )
                    )
)
