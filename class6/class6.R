# Can you improve this analysis code?
library(bio3d)

proteinfunction <- function(a){
  #s <- read.pdb(a)
  #s.chainA <-trim.pdb(read.pdb(a), chain="A", elety="CA")  
 # s.b <- s.chainA$atom$b
  plotb3(x.chainA$atom$b, sse=trim.pdb(read.pdb(a), chain="A", elety="CA"), typ="1", ylab="Bfactor")
  return(plotb3)
}


