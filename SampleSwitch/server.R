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
    sample1 <- gsub("( )+", "", unlist(strsplit(input$Sample1, split="\\n")))
    sample2 <- gsub("( )+", "", unlist(strsplit(input$Sample2, split="\\n")))
    #output$sample1 <- renderPrint({ sample1 })
    #output$sample2 <- renderPrint({ sample2 })
    ss.plot.df <- data.frame(from = sample1, to = sample2, value=1)
    col_fun = colorRamp2(c(1, nrow(ss.plot.df)/2, nrow(ss.plot.df)), c("green", "white", "red"))
    chordDiagram(ss.plot.df, directional = 1, direction.type = "arrows", annotationTrack = c("name", "grid"), 
                 col=col_fun(1 : nrow(ss.plot.df)))
  })
  })
}
