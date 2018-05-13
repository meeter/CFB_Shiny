---
output:
  html_document:
    theme: united
---

# Help
CFB_shiny is a web-service aiming to provide one-stop analysis and visualization interface for several widely-used CFB tools. R

Code can be found on github: https://github.com/meeter/CFB_Shiny

To run this app locally on your machine, download R or RStudio and run the following commands once to set up the environment:

```
install.packages("shiny")
```

You may now run the shiny app with just one command in R:

```
shiny::runGitHub("CFB_shiny", "meeter")
```

<a name="Gene"></a> 

## Sample Label Switch
1. __Upload File__: Upload the retained_variants_allsamples.txt, and return a table with possible label switch events.
2. __Plot Chord-Diagram__: Input confirmed sample label switch events and generate a Chord-Diagram.

<a name="Sample Label Switch"></a> 






