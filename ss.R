#setwd("/Users/jyu/Documents/Projects/Shiny/SampleSwitch")
#library(circlize)

#################################################################################
#####Code Chunk 1: find out switched sample for samples with FN
#################################################################################
sample_switch <- function(file.in, offset) {
#file.in <- "retained_variants_allsamples.txt"; offset = 10
#addrowname.cmd <- paste("awk -v OFS='\t' '{if (NR >1) {$1=NR-1}; print $0}' ", file.in, ">tmp.txt && mv tmp.txt ", file.in, sep="")
#system(addrowname.cmd)
variants <- read.table(file.in$datapath, header=T, fill=T, sep="\t", quote="")
colnames(variants)[7] <- "chr"
variants$start <- as.integer(variants$start)
variants$sample <- as.character(variants$sample)
variants$ref <- as.character(variants$ref)
variants$alt <- as.character(variants$alt)

variants.FN <- subset(variants, tag == "FN")
variants.EV <- subset(variants, tag == "EV")

variants.FN.cor <- variants.FN[, c("chr", "start", "ref", "alt", "sample")] ###Create a dataframe for corrected FN
variants.FN.cor$start_new <- ""; variants.FN.cor$ref_new <- ""; variants.FN.cor$alt_new <- ""; variants.FN.cor$sample_new <- ""; 

sapply(1 : nrow(variants.FN.cor), function(i) {
	for (j in 1 : nrow(variants.EV))
	{
		if (variants.FN[i, "chr"] == variants.EV[j, "chr"] & variants.FN[i, "sample"] != variants.EV[j, "sample"] &
			variants.FN[i, "start"] <= variants.EV[j, "start"] + offset & variants.FN[i, "start"] >= variants.EV[j, "start"] - offset)
			{variants.FN.cor[i, "start_new"] <<- variants.EV[j, "start"]
			 variants.FN.cor[i, "ref_new"] <<- variants.EV[j, "ref"]
			 variants.FN.cor[i, "alt_new"] <<- variants.EV[j, "alt"]
			 variants.FN.cor[i, "sample_new"] <<- variants.EV[j, "sample"]		
			}
	}
})

#####Output Sample Switch Table
ss.output <- subset(variants.FN.cor, sample != sample_new & sample_new != "")
#####Output Sample Switch Plot
ss.plot <- ss.output[, c("sample", "sample_new")]
ss.plot$value <- 1
return(list(ss.output = ss.output, ss.plot = ss.plot))
}
