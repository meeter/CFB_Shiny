############################################################
#####Function 1: Get missing Genes
############################################################
getMissGenes <- function(input, data) {
      NAME <- GetName(input$NAME)
      MissGene <- NAME[is.na(match(tolower(NAME), tolower(data$"gene_name")))]
      print("Name of Missing Gene:")
      MissGene
}

############################################################
#####Function 3: DataTable
############################################################
TableGene <- function(input, data) {
  NAME <- GetName(input$NAME)
  data[match(tolower(NAME), tolower(data$gene_name)), c(7,GetIndex_Gene(input))]
}

############################################################
#####Function 4: Heatmap
############################################################
HeatmapGene <- function(input, GeneTE_1.tpm) {
  NAME <- GetName(input$NAME)
  #outfile <- tempfile(fileext='.png')
  #png(outfile, width=700, height=700 + 11.66 * nrow(data[match(GetName(tolower(input$NAME)), tolower(data$"gene_name")),]))
  heatmap.data <- GeneTE_1.tpm[match(tolower(NAME), tolower(GeneTE_1.tpm$gene_name)), c(GetIndex_Gene(input),7)]
  heatmap.data <- heatmap.data[complete.cases(heatmap.data),] #Remove DataTable with unmatched Gene Symbol 
  row.names(heatmap.data) <- gsub("mmu-", "", heatmap.data[, ncol(heatmap.data)])
  heatmap.data <- heatmap.data[, -ncol(heatmap.data)]
  data <- as.matrix(heatmap.data); data <- t(apply(data, 1, function(x){2*(x-mean(x))/(max(x)-min(x))}))
  plot_ly(y = row.names(heatmap.data), x = colnames(heatmap.data)[1:ncol(heatmap.data)], 
          z = data, colors = colorRamp(c("skyblue", "white", "red")),
          type = "heatmap", colorbar = list(title = "Log2-TPM"), height = 300+11.66*nrow(heatmap.data)
          ) %>%
    layout(xaxis = list(title = ""),  yaxis = list(title = ""), margin = list(l = 100, b = 100))

}





  

  

  
   
