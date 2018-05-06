source("SS.R", local=TRUE)
library(circlize)
library(markdown)

server <- function(input, output) {
  observeEvent(input$offset,  {
  output$ss_data <- renderDataTable({
    file1 <- input$file1
    if (is.null(file1)) {return(NULL)}
    #####Get DataTable
    ss.lst <- sample_switch(file1, input$offset)
    return(ss.lst$ss.output)
    #return(data.frame(file = file1$datapath, offset = input$offset))
    })
  output$ss_plot <- renderPlot({
    file1 <- input$file1
    if (is.null(file1)) {return(NULL)}
    ss.lst <- sample_switch(file1, input$offset)
    col_fun = colorRamp2(c(1, nrow(ss.lst$ss.plot)/2, nrow(ss.lst$ss.plot)), c("green", "white", "red"))
    chordDiagram(ss.lst$ss.plot, directional = 1, direction.type = "arrows", annotationTrack = c("name", "grid"), 
                 col=col_fun(1 : nrow(ss.lst$ss.plot)))
  })
  })
}
