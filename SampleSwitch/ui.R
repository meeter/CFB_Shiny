library(shiny)
library(shinythemes)


customHeaderPanel <- function(title,windowTitle=title){
  tagList(
    tags$head(
      tags$title(windowTitle),
      tags$link(rel="stylesheet", type="text/css",
                href="app.css"),
      tags$h1(a(href="http://www.ohsu.edu/xd/health/services/heart-vascular/"))
    )
  )
}

tagList(
  titlePanel(div("CFB Shiny ToolBox", align="center", style="color:#4fc5d6")),
  navbarPage(
    theme = shinytheme("cerulean"),
    #theme = "style.css",
    title = "",
    ## =========================================================================== ##
    ## Gene TABS
    ## =========================================================================== ##
    source("ui_Gene.R",local=TRUE)$value,
    
    
    ## ============================================================================ ##
    ## HELP TAB
    ## ============================================================================ ##   
    source("Help.R",local=TRUE)$value,
    
    ## ==================================================================================== ##
    ## FOOTER
    ## ==================================================================================== ##              
    footer=p(hr(),p("Created by ", a("Jian Yu", href="https://github.com/meeter/"),
                    " from ",align="center",width=4),
             p(("Client Facing Bioinformatics, "),a("SOPHiA GENETICS",href="https://www.sophiagenetics.com/home.html"), align="center",width=4),
             p(("Copyright (C) 2018, code licensed under GPLv3"),align="center",width=4),
             p(("Code available on Github:"),a("https://github.com",href="https://github.com/"),align="center",width=4)
    ),
    ## ==================================================================================== ##
    ## end
    ## ==================================================================================== ## 
    tags$head(includeScript("google-analytics.js"))
  ) #end navbarpage
) #end taglist







