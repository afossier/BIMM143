Class6
================
Amber Fossier
1/30/2019

``` r
#Function reads in a protein and searches it in the PDB to analyze the drug interactions, and plots the output for the protein
proteinfunction <- function(protein){
  library(bio3d)
  #Reads the inputted protein in the PDB
  s <- read.pdb(protein)
  #trims the PDB results
  s.chainA <-trim.pdb(s, chain="A", elety="CA")  
  #selects specific columns of the data
  s.b <- s.chainA$atom$b
  #data is plotted
  plotb3(s.b, sse=s.chainA, typ="l", ylab="Bfactor")
}
```

``` r
#calling the function
proteinfunction("1AKE")
```

    ##   Note: Accessing on-line PDB file
    ##    PDB has ALT records, taking A only, rm.alt=TRUE

![](class6_files/figure-markdown_github/unnamed-chunk-2-1.png)
