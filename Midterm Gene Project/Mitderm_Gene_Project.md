Midterm Project: Find a Gene
================

Generate a heatmap plot and add to your report.
-----------------------------------------------

``` r
library(bio3d)
align<-read.fasta("alignment.fst")
head(align)
```

    ## $id
    ## [1] "Korean_Cattle"         "Fire_belly_newt"       "Red_Junglefowl"       
    ## [4] "Westerned_Clawed_Frog" "Fathead_Minnow"        "House_mouse"          
    ## [7] "Human_KIF11"           "Wild_boar"            
    ## 
    ## $ali
    ##                       [,1] [,2] [,3] [,4] [,5] [,6] [,7] [,8] [,9] [,10]
    ## Korean_Cattle         "Y"  "A"  "H"  "R"  "A"  "K"  "N"  "I"  "L"  "N"  
    ## Fire_belly_newt       "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  
    ## Red_Junglefowl        "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  
    ## Westerned_Clawed_Frog "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  
    ## Fathead_Minnow        "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  
    ## House_mouse           "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  
    ## Human_KIF11           "M"  "A"  "S"  "Q"  "P"  "N"  "S"  "S"  "A"  "K"  
    ## Wild_boar             "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  "-"  
    ##                       [,11] [,12] [,13] [,14] [,15] [,16] [,17] [,18]
    ## Korean_Cattle         "K"   "P"   "E"   "V"   "N"   "Q"   "K"   "-"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Westerned_Clawed_Frog "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Fathead_Minnow        "-"   "-"   "-"   "-"   "-"   "G"   "R"   "N"  
    ## House_mouse           "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Human_KIF11           "K"   "K"   "E"   "E"   "K"   "G"   "K"   "N"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,19] [,20] [,21] [,22] [,23] [,24] [,25] [,26]
    ## Korean_Cattle         "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Westerned_Clawed_Frog "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Fathead_Minnow        "I"   "Q"   "V"   "V"   "V"   "R"   "C"   "R"  
    ## House_mouse           "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Human_KIF11           "I"   "Q"   "V"   "V"   "V"   "R"   "C"   "R"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,27] [,28] [,29] [,30] [,31] [,32] [,33] [,34]
    ## Korean_Cattle         "-"   "-"   "-"   "L"   "T"   "K"   "K"   "A"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Westerned_Clawed_Frog "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Fathead_Minnow        "P"   "F"   "N"   "T"   "V"   "E"   "R"   "K"  
    ## House_mouse           "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Human_KIF11           "P"   "F"   "N"   "L"   "A"   "E"   "R"   "K"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,35] [,36] [,37] [,38] [,39] [,40] [,41] [,42]
    ## Korean_Cattle         "L"   "I"   "K"   "E"   "Y"   "T"   "E"   "E"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Westerned_Clawed_Frog "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Fathead_Minnow        "S"   "A"   "S"   "H"   "T"   "V"   "V"   "E"  
    ## House_mouse           "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Human_KIF11           "A"   "S"   "A"   "H"   "S"   "I"   "V"   "E"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,43] [,44] [,45] [,46] [,47] [,48] [,49] [,50]
    ## Korean_Cattle         "I"   "E"   "R"   "L"   "K"   "R"   "D"   "L"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Westerned_Clawed_Frog "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Fathead_Minnow        "C"   "D"   "Q"   "N"   "K"   "K"   "E"   "L"  
    ## House_mouse           "-"   "-"   "-"   "-"   "R"   "K"   "E"   "V"  
    ## Human_KIF11           "C"   "D"   "P"   "V"   "R"   "K"   "E"   "V"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,51] [,52] [,53] [,54] [,55] [,56] [,57] [,58]
    ## Korean_Cattle         "A"   "-"   "-"   "-"   "-"   "-"   "-"   "A"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Westerned_Clawed_Frog "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Fathead_Minnow        "T"   "V"   "R"   "T"   "G"   "G"   "A"   "T"  
    ## House_mouse           "S"   "V"   "R"   "T"   "A"   "G"   "L"   "T"  
    ## Human_KIF11           "S"   "V"   "R"   "T"   "G"   "G"   "L"   "A"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,59] [,60] [,61] [,62] [,63] [,64] [,65] [,66]
    ## Korean_Cattle         "A"   "R"   "E"   "K"   "N"   "G"   "V"   "Y"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Westerned_Clawed_Frog "-"   "-"   "-"   "-"   "K"   "K"   "T"   "Y"  
    ## Fathead_Minnow        "D"   "K"   "S"   "S"   "R"   "K"   "T"   "Y"  
    ## House_mouse           "D"   "K"   "T"   "S"   "K"   "K"   "T"   "Y"  
    ## Human_KIF11           "D"   "K"   "S"   "S"   "R"   "K"   "T"   "Y"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,67] [,68] [,69] [,70] [,71] [,72] [,73] [,74]
    ## Korean_Cattle         "I"   "S"   "E"   "E"   "N"   "F"   "R"   "A"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "-"   "-"   "-"   "-"   "-"   "F"   "R"   "A"  
    ## Westerned_Clawed_Frog "T"   "F"   "D"   "M"   "V"   "F"   "G"   "P"  
    ## Fathead_Minnow        "T"   "F"   "D"   "M"   "V"   "F"   "G"   "P"  
    ## House_mouse           "T"   "F"   "D"   "M"   "V"   "F"   "G"   "A"  
    ## Human_KIF11           "T"   "F"   "D"   "M"   "V"   "F"   "G"   "A"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,75] [,76] [,77] [,78] [,79] [,80] [,81] [,82]
    ## Korean_Cattle         "M"   "S"   "G"   "K"   "L"   "T"   "V"   "Q"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "Q"   "A"   "K"   "Q"   "I"   "D"   "V"   "Y"  
    ## Westerned_Clawed_Frog "A"   "A"   "K"   "Q"   "I"   "D"   "V"   "Y"  
    ## Fathead_Minnow        "S"   "A"   "K"   "Q"   "I"   "D"   "V"   "Y"  
    ## House_mouse           "S"   "T"   "K"   "Q"   "I"   "D"   "V"   "Y"  
    ## Human_KIF11           "S"   "T"   "K"   "Q"   "I"   "D"   "V"   "Y"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,83] [,84] [,85] [,86] [,87] [,88] [,89] [,90]
    ## Korean_Cattle         "E"   "E"   "Q"   "I"   "V"   "E"   "L"   "V"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "R"   "S"   "V"   "V"   "C"   "P"   "I"   "L"  
    ## Westerned_Clawed_Frog "R"   "S"   "V"   "V"   "C"   "P"   "I"   "L"  
    ## Fathead_Minnow        "R"   "S"   "V"   "V"   "C"   "P"   "I"   "L"  
    ## House_mouse           "R"   "S"   "V"   "V"   "C"   "P"   "I"   "L"  
    ## Human_KIF11           "R"   "S"   "V"   "V"   "C"   "P"   "I"   "L"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,91] [,92] [,93] [,94] [,95] [,96] [,97] [,98]
    ## Korean_Cattle         "E"   "K"   "I"   "A"   "-"   "-"   "-"   "-"  
    ## Fire_belly_newt       "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ## Red_Junglefowl        "D"   "E"   "V"   "I"   "M"   "G"   "Y"   "N"  
    ## Westerned_Clawed_Frog "D"   "E"   "V"   "I"   "M"   "G"   "Y"   "N"  
    ## Fathead_Minnow        "D"   "E"   "V"   "I"   "M"   "G"   "Y"   "N"  
    ## House_mouse           "D"   "E"   "V"   "I"   "M"   "G"   "Y"   "N"  
    ## Human_KIF11           "D"   "E"   "V"   "I"   "M"   "G"   "Y"   "N"  
    ## Wild_boar             "-"   "-"   "-"   "-"   "-"   "-"   "-"   "-"  
    ##                       [,99] [,100] [,101] [,102] [,103] [,104] [,105]
    ## Korean_Cattle         "-"   "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"   "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "C"   "T"    "V"    "F"    "A"    "Y"    "G"   
    ## Westerned_Clawed_Frog "C"   "T"    "V"    "F"    "A"    "Y"    "G"   
    ## Fathead_Minnow        "C"   "T"    "I"    "F"    "A"    "Y"    "G"   
    ## House_mouse           "C"   "T"    "I"    "F"    "A"    "Y"    "G"   
    ## Human_KIF11           "C"   "T"    "I"    "F"    "A"    "Y"    "G"   
    ## Wild_boar             "-"   "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,106] [,107] [,108] [,109] [,110] [,111] [,112]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "Q"    "T"    "G"    "T"    "G"    "K"    "T"   
    ## Westerned_Clawed_Frog "Q"    "T"    "G"    "T"    "G"    "K"    "T"   
    ## Fathead_Minnow        "Q"    "T"    "G"    "T"    "G"    "K"    "T"   
    ## House_mouse           "Q"    "T"    "G"    "T"    "G"    "K"    "T"   
    ## Human_KIF11           "Q"    "T"    "G"    "T"    "G"    "K"    "T"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,113] [,114] [,115] [,116] [,117] [,118] [,119]
    ## Korean_Cattle         "-"    "A"    "V"    "E"    "E"    "E"    "L"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "F"    "T"    "M"    "E"    "G"    "E"    "R"   
    ## Westerned_Clawed_Frog "F"    "T"    "M"    "E"    "G"    "E"    "R"   
    ## Fathead_Minnow        "F"    "T"    "M"    "E"    "G"    "D"    "R"   
    ## House_mouse           "F"    "T"    "M"    "E"    "G"    "E"    "R"   
    ## Human_KIF11           "F"    "T"    "M"    "E"    "G"    "E"    "R"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,120] [,121] [,122] [,123] [,124] [,125] [,126]
    ## Korean_Cattle         "N"    "R"    "V"    "T"    "E"    "L"    "F"   
    ## Fire_belly_newt       "A"    "P"    "D"    "G"    "E"    "F"    "T"   
    ## Red_Junglefowl        "S"    "P"    "N"    "E"    "E"    "Y"    "T"   
    ## Westerned_Clawed_Frog "S"    "A"    "D"    "E"    "E"    "F"    "T"   
    ## Fathead_Minnow        "S"    "P"    "N"    "E"    "E"    "F"    "T"   
    ## House_mouse           "S"    "P"    "N"    "E"    "V"    "Y"    "T"   
    ## Human_KIF11           "S"    "P"    "N"    "E"    "E"    "Y"    "T"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,127] [,128] [,129] [,130] [,131] [,132] [,133]
    ## Korean_Cattle         "M"    "D"    "S"    "K"    "N"    "E"    "L"   
    ## Fire_belly_newt       "W"    "D"    "E"    "D"    "P"    "L"    "A"   
    ## Red_Junglefowl        "W"    "E"    "E"    "D"    "P"    "L"    "A"   
    ## Westerned_Clawed_Frog "W"    "E"    "Q"    "D"    "P"    "L"    "A"   
    ## Fathead_Minnow        "W"    "E"    "E"    "D"    "P"    "L"    "A"   
    ## House_mouse           "W"    "E"    "E"    "D"    "P"    "L"    "A"   
    ## Human_KIF11           "W"    "E"    "E"    "D"    "P"    "L"    "A"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,134] [,135] [,136] [,137] [,138] [,139] [,140]
    ## Korean_Cattle         "N"    "Q"    "C"    "K"    "S"    "D"    "L"   
    ## Fire_belly_newt       "G"    "I"    "I"    "P"    "R"    "T"    "L"   
    ## Red_Junglefowl        "G"    "I"    "I"    "P"    "R"    "T"    "L"   
    ## Westerned_Clawed_Frog "G"    "I"    "I"    "P"    "R"    "T"    "L"   
    ## Fathead_Minnow        "G"    "I"    "I"    "P"    "R"    "T"    "L"   
    ## House_mouse           "G"    "I"    "I"    "P"    "R"    "T"    "L"   
    ## Human_KIF11           "G"    "I"    "I"    "P"    "R"    "T"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,141] [,142] [,143] [,144] [,145] [,146] [,147]
    ## Korean_Cattle         "Q"    "S"    "K"    "T"    "Q"    "E"    "L"   
    ## Fire_belly_newt       "H"    "Q"    "I"    "F"    "E"    "K"    "L"   
    ## Red_Junglefowl        "H"    "Q"    "I"    "F"    "E"    "K"    "L"   
    ## Westerned_Clawed_Frog "H"    "Q"    "I"    "F"    "E"    "K"    "L"   
    ## Fathead_Minnow        "H"    "Q"    "I"    "F"    "E"    "K"    "L"   
    ## House_mouse           "H"    "Q"    "I"    "F"    "E"    "K"    "L"   
    ## Human_KIF11           "H"    "Q"    "I"    "F"    "E"    "K"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,148] [,149] [,150] [,151] [,152] [,153] [,154]
    ## Korean_Cattle         "E"    "T"    "-"    "-"    "T"    "Q"    "R"   
    ## Fire_belly_newt       "S"    "E"    "N"    "G"    "T"    "E"    "F"   
    ## Red_Junglefowl        "T"    "E"    "N"    "G"    "T"    "E"    "F"   
    ## Westerned_Clawed_Frog "S"    "E"    "N"    "G"    "T"    "E"    "F"   
    ## Fathead_Minnow        "S"    "N"    "N"    "G"    "T"    "E"    "F"   
    ## House_mouse           "T"    "D"    "N"    "G"    "T"    "E"    "F"   
    ## Human_KIF11           "T"    "D"    "N"    "G"    "T"    "E"    "F"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,155] [,156] [,157] [,158] [,159] [,160] [,161]
    ## Korean_Cattle         "Q"    "L"    "Q"    "E"    "T"    "K"    "L"   
    ## Fire_belly_newt       "S"    "V"    "K"    "V"    "S"    "L"    "L"   
    ## Red_Junglefowl        "S"    "V"    "K"    "V"    "S"    "L"    "L"   
    ## Westerned_Clawed_Frog "S"    "V"    "K"    "V"    "S"    "L"    "L"   
    ## Fathead_Minnow        "S"    "V"    "K"    "V"    "S"    "L"    "L"   
    ## House_mouse           "S"    "V"    "K"    "V"    "S"    "L"    "L"   
    ## Human_KIF11           "S"    "V"    "K"    "V"    "S"    "L"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,162] [,163] [,164] [,165] [,166] [,167] [,168]
    ## Korean_Cattle         "Q"    "L"    "V"    "E"    "E"    "E"    "Y"   
    ## Fire_belly_newt       "E"    "I"    "Y"    "N"    "E"    "E"    "L"   
    ## Red_Junglefowl        "E"    "I"    "Y"    "N"    "E"    "E"    "L"   
    ## Westerned_Clawed_Frog "E"    "I"    "Y"    "N"    "E"    "E"    "L"   
    ## Fathead_Minnow        "E"    "I"    "Y"    "N"    "E"    "E"    "L"   
    ## House_mouse           "E"    "I"    "Y"    "N"    "E"    "E"    "L"   
    ## Human_KIF11           "E"    "I"    "Y"    "N"    "E"    "E"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,169] [,170] [,171] [,172] [,173] [,174] [,175]
    ## Korean_Cattle         "-"    "-"    "I"    "T"    "S"    "A"    "L"   
    ## Fire_belly_newt       "F"    "D"    "L"    "L"    "S"    "P"    "C"   
    ## Red_Junglefowl        "F"    "D"    "L"    "L"    "N"    "P"    "A"   
    ## Westerned_Clawed_Frog "F"    "D"    "L"    "L"    "S"    "P"    "S"   
    ## Fathead_Minnow        "F"    "D"    "L"    "L"    "S"    "P"    "A"   
    ## House_mouse           "F"    "D"    "L"    "L"    "S"    "P"    "S"   
    ## Human_KIF11           "F"    "D"    "L"    "L"    "N"    "P"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,176] [,177] [,178] [,179] [,180] [,181] [,182]
    ## Korean_Cattle         "E"    "S"    "T"    "E"    "E"    "R"    "L"   
    ## Fire_belly_newt       "P"    "D"    "V"    "N"    "E"    "R"    "L"   
    ## Red_Junglefowl        "P"    "D"    "V"    "G"    "E"    "R"    "L"   
    ## Westerned_Clawed_Frog "P"    "D"    "V"    "G"    "E"    "R"    "L"   
    ## Fathead_Minnow        "P"    "D"    "V"    "T"    "E"    "R"    "L"   
    ## House_mouse           "S"    "D"    "V"    "S"    "E"    "R"    "L"   
    ## Human_KIF11           "S"    "D"    "V"    "S"    "E"    "R"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,183] [,184] [,185] [,186] [,187] [,188] [,189]
    ## Korean_Cattle         "H"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "Q"    "M"    "F"    "D"    "D"    "P"    "R"   
    ## Red_Junglefowl        "Q"    "M"    "F"    "D"    "D"    "P"    "R"   
    ## Westerned_Clawed_Frog "Q"    "M"    "F"    "D"    "D"    "P"    "R"   
    ## Fathead_Minnow        "Q"    "L"    "F"    "D"    "D"    "P"    "R"   
    ## House_mouse           "Q"    "M"    "F"    "D"    "D"    "P"    "R"   
    ## Human_KIF11           "Q"    "M"    "F"    "D"    "D"    "P"    "R"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,190] [,191] [,192] [,193] [,194] [,195] [,196]
    ## Korean_Cattle         "N"    "A"    "A"    "N"    "R"    "L"    "L"   
    ## Fire_belly_newt       "N"    "K"    "R"    "G"    "V"    "I"    "I"   
    ## Red_Junglefowl        "N"    "K"    "R"    "G"    "V"    "I"    "I"   
    ## Westerned_Clawed_Frog "N"    "K"    "R"    "G"    "V"    "I"    "I"   
    ## Fathead_Minnow        "N"    "K"    "R"    "G"    "V"    "T"    "I"   
    ## House_mouse           "N"    "K"    "R"    "G"    "V"    "I"    "I"   
    ## Human_KIF11           "N"    "K"    "R"    "G"    "V"    "I"    "I"   
    ## Wild_boar             "N"    "K"    "R"    "G"    "V"    "I"    "I"   
    ##                       [,197] [,198] [,199] [,200] [,201] [,202] [,203]
    ## Korean_Cattle         "N"    "T"    "V"    "E"    "E"    "-"    "T"   
    ## Fire_belly_newt       "K"    "G"    "L"    "E"    "E"    "V"    "T"   
    ## Red_Junglefowl        "K"    "G"    "L"    "E"    "E"    "V"    "T"   
    ## Westerned_Clawed_Frog "K"    "G"    "L"    "E"    "E"    "V"    "S"   
    ## Fathead_Minnow        "K"    "G"    "L"    "E"    "E"    "V"    "T"   
    ## House_mouse           "K"    "G"    "L"    "E"    "E"    "I"    "T"   
    ## Human_KIF11           "K"    "G"    "L"    "E"    "E"    "I"    "T"   
    ## Wild_boar             "K"    "G"    "L"    "E"    "E"    "I"    "T"   
    ##                       [,204] [,205] [,206] [,207] [,208] [,209] [,210]
    ## Korean_Cattle         "T"    "K"    "D"    "V"    "F"    "G"    "L"   
    ## Fire_belly_newt       "V"    "H"    "N"    "K"    "N"    "E"    "V"   
    ## Red_Junglefowl        "V"    "H"    "N"    "K"    "N"    "E"    "V"   
    ## Westerned_Clawed_Frog "V"    "H"    "N"    "K"    "D"    "E"    "V"   
    ## Fathead_Minnow        "V"    "H"    "N"    "K"    "N"    "E"    "V"   
    ## House_mouse           "V"    "H"    "N"    "K"    "D"    "E"    "V"   
    ## Human_KIF11           "V"    "H"    "N"    "K"    "D"    "E"    "V"   
    ## Wild_boar             "V"    "H"    "N"    "K"    "N"    "E"    "V"   
    ##                       [,211] [,212] [,213] [,214] [,215] [,216] [,217]
    ## Korean_Cattle         "H"    "S"    "K"    "L"    "D"    "R"    "K"   
    ## Fire_belly_newt       "Y"    "Q"    "I"    "L"    "E"    "R"    "G"   
    ## Red_Junglefowl        "Y"    "Q"    "I"    "L"    "E"    "R"    "G"   
    ## Westerned_Clawed_Frog "Y"    "H"    "I"    "L"    "E"    "R"    "G"   
    ## Fathead_Minnow        "Y"    "Q"    "I"    "L"    "E"    "R"    "G"   
    ## House_mouse           "Y"    "Q"    "I"    "L"    "E"    "K"    "G"   
    ## Human_KIF11           "Y"    "Q"    "I"    "L"    "E"    "K"    "G"   
    ## Wild_boar             "Y"    "Q"    "I"    "L"    "E"    "K"    "G"   
    ##                       [,218] [,219] [,220] [,221] [,222] [,223] [,224]
    ## Korean_Cattle         "K"    "A"    "V"    "D"    "Q"    "H"    "N"   
    ## Fire_belly_newt       "A"    "A"    "K"    "R"    "T"    "T"    "A"   
    ## Red_Junglefowl        "A"    "A"    "K"    "R"    "T"    "T"    "A"   
    ## Westerned_Clawed_Frog "A"    "A"    "R"    "R"    "K"    "T"    "A"   
    ## Fathead_Minnow        "A"    "A"    "K"    "R"    "K"    "T"    "A"   
    ## House_mouse           "A"    "A"    "K"    "R"    "T"    "T"    "A"   
    ## Human_KIF11           "A"    "A"    "K"    "R"    "T"    "T"    "A"   
    ## Wild_boar             "A"    "A"    "K"    "R"    "T"    "T"    "A"   
    ##                       [,225] [,226] [,227] [,228] [,229] [,230] [,231]
    ## Korean_Cattle         "A"    "E"    "A"    "Q"    "D"    "V"    "F"   
    ## Fire_belly_newt       "S"    "T"    "L"    "M"    "N"    "A"    "Y"   
    ## Red_Junglefowl        "A"    "T"    "Y"    "M"    "N"    "A"    "Y"   
    ## Westerned_Clawed_Frog "S"    "T"    "L"    "M"    "N"    "A"    "Y"   
    ## Fathead_Minnow        "S"    "T"    "L"    "M"    "N"    "A"    "Y"   
    ## House_mouse           "A"    "T"    "L"    "M"    "N"    "A"    "Y"   
    ## Human_KIF11           "A"    "T"    "L"    "M"    "N"    "A"    "Y"   
    ## Wild_boar             "A"    "T"    "L"    "M"    "N"    "A"    "Y"   
    ##                       [,232] [,233] [,234] [,235] [,236] [,237] [,238]
    ## Korean_Cattle         "G"    "Q"    "N"    "L"    "N"    "S"    "L"   
    ## Fire_belly_newt       "S"    "S"    "R"    "S"    "H"    "S"    "V"   
    ## Red_Junglefowl        "S"    "S"    "R"    "S"    "H"    "S"    "V"   
    ## Westerned_Clawed_Frog "S"    "S"    "R"    "S"    "H"    "S"    "V"   
    ## Fathead_Minnow        "S"    "S"    "R"    "S"    "H"    "S"    "V"   
    ## House_mouse           "S"    "S"    "R"    "S"    "H"    "S"    "V"   
    ## Human_KIF11           "S"    "S"    "R"    "S"    "H"    "S"    "V"   
    ## Wild_boar             "S"    "S"    "R"    "S"    "H"    "S"    "V"   
    ##                       [,239] [,240] [,241] [,242] [,243] [,244] [,245]
    ## Korean_Cattle         "F"    "N"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "F"    "S"    "V"    "T"    "I"    "H"    "M"   
    ## Red_Junglefowl        "F"    "S"    "I"    "T"    "I"    "H"    "M"   
    ## Westerned_Clawed_Frog "F"    "S"    "V"    "T"    "I"    "H"    "M"   
    ## Fathead_Minnow        "F"    "S"    "V"    "T"    "I"    "H"    "M"   
    ## House_mouse           "F"    "S"    "V"    "T"    "I"    "H"    "M"   
    ## Human_KIF11           "F"    "S"    "V"    "T"    "I"    "H"    "M"   
    ## Wild_boar             "F"    "S"    "V"    "T"    "I"    "H"    "M"   
    ##                       [,246] [,247] [,248] [,249] [,250] [,251] [,252]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "N"    "M"   
    ## Fire_belly_newt       "K"    "E"    "T"    "T"    "V"    "D"    "G"   
    ## Red_Junglefowl        "K"    "E"    "T"    "T"    "V"    "D"    "G"   
    ## Westerned_Clawed_Frog "K"    "E"    "T"    "T"    "V"    "D"    "G"   
    ## Fathead_Minnow        "K"    "E"    "I"    "T"    "L"    "D"    "G"   
    ## House_mouse           "K"    "X"    "T"    "T"    "I"    "D"    "G"   
    ## Human_KIF11           "K"    "E"    "T"    "T"    "I"    "D"    "G"   
    ## Wild_boar             "K"    "E"    "T"    "T"    "V"    "D"    "G"   
    ##                       [,253] [,254] [,255] [,256] [,257] [,258] [,259]
    ## Korean_Cattle         "E"    "E"    "L"    "I"    "K"    "D"    "G"   
    ## Fire_belly_newt       "E"    "E"    "L"    "V"    "K"    "X"    "G"   
    ## Red_Junglefowl        "E"    "E"    "L"    "V"    "K"    "I"    "G"   
    ## Westerned_Clawed_Frog "E"    "E"    "L"    "V"    "K"    "I"    "G"   
    ## Fathead_Minnow        "E"    "E"    "L"    "V"    "K"    "I"    "G"   
    ## House_mouse           "E"    "E"    "L"    "V"    "K"    "I"    "G"   
    ## Human_KIF11           "E"    "E"    "L"    "V"    "K"    "I"    "G"   
    ## Wild_boar             "E"    "E"    "L"    "V"    "K"    "I"    "G"   
    ##                       [,260] [,261] [,262] [,263] [,264] [,265] [,266]
    ## Korean_Cattle         "S"    "M"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "K"    "L"    "N"    "L"    "V"    "X"    "L"   
    ## Red_Junglefowl        "K"    "L"    "N"    "L"    "V"    "D"    "L"   
    ## Westerned_Clawed_Frog "K"    "L"    "N"    "L"    "V"    "D"    "L"   
    ## Fathead_Minnow        "K"    "L"    "N"    "L"    "V"    "D"    "L"   
    ## House_mouse           "K"    "L"    "N"    "L"    "V"    "D"    "L"   
    ## Human_KIF11           "K"    "L"    "N"    "L"    "V"    "D"    "L"   
    ## Wild_boar             "K"    "L"    "N"    "L"    "V"    "D"    "L"   
    ##                       [,267] [,268] [,269] [,270] [,271] [,272] [,273]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "A"    "G"    "S"    "E"    "N"    "I"    "G"   
    ## Red_Junglefowl        "A"    "G"    "S"    "E"    "N"    "I"    "G"   
    ## Westerned_Clawed_Frog "A"    "G"    "S"    "E"    "N"    "I"    "G"   
    ## Fathead_Minnow        "A"    "G"    "S"    "E"    "N"    "I"    "G"   
    ## House_mouse           "A"    "G"    "S"    "E"    "N"    "I"    "G"   
    ## Human_KIF11           "A"    "G"    "S"    "E"    "N"    "I"    "G"   
    ## Wild_boar             "A"    "G"    "S"    "E"    "N"    "I"    "G"   
    ##                       [,274] [,275] [,276] [,277] [,278] [,279] [,280]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "R"    "S"    "G"    "A"    "V"    "D"    "K"   
    ## Red_Junglefowl        "R"    "S"    "G"    "A"    "V"    "D"    "K"   
    ## Westerned_Clawed_Frog "R"    "S"    "G"    "A"    "V"    "D"    "K"   
    ## Fathead_Minnow        "R"    "S"    "G"    "A"    "V"    "D"    "K"   
    ## House_mouse           "R"    "S"    "G"    "A"    "V"    "D"    "K"   
    ## Human_KIF11           "R"    "S"    "G"    "A"    "V"    "D"    "K"   
    ## Wild_boar             "R"    "S"    "G"    "A"    "V"    "D"    "K"   
    ##                       [,281] [,282] [,283] [,284] [,285] [,286] [,287]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "R"    "A"    "R"    "E"    "A"    "G"    "N"   
    ## Red_Junglefowl        "R"    "A"    "R"    "E"    "A"    "G"    "N"   
    ## Westerned_Clawed_Frog "R"    "A"    "R"    "E"    "A"    "G"    "N"   
    ## Fathead_Minnow        "R"    "A"    "R"    "E"    "A"    "G"    "N"   
    ## House_mouse           "R"    "A"    "R"    "E"    "A"    "-"    "-"   
    ## Human_KIF11           "R"    "A"    "R"    "E"    "A"    "G"    "N"   
    ## Wild_boar             "R"    "A"    "R"    "E"    "A"    "G"    "N"   
    ##                       [,288] [,289] [,290] [,291] [,292] [,293] [,294]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "I"    "N"    "Q"    "S"    "L"    "L"    "T"   
    ## Red_Junglefowl        "I"    "N"    "Q"    "S"    "L"    "L"    "T"   
    ## Westerned_Clawed_Frog "I"    "N"    "Q"    "S"    "L"    "L"    "T"   
    ## Fathead_Minnow        "I"    "N"    "Q"    "S"    "L"    "L"    "T"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "N"    "Q"    "S"    "L"    "L"    "T"   
    ## Wild_boar             "I"    "N"    "Q"    "S"    "L"    "L"    "T"   
    ##                       [,295] [,296] [,297] [,298] [,299] [,300] [,301]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "L"    "G"    "R"    "V"    "I"    "T"    "A"   
    ## Red_Junglefowl        "L"    "G"    "R"    "V"    "I"    "S"    "A"   
    ## Westerned_Clawed_Frog "L"    "G"    "R"    "V"    "I"    "T"    "A"   
    ## Fathead_Minnow        "L"    "G"    "R"    "V"    "I"    "K"    "A"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "G"    "R"    "V"    "I"    "T"    "A"   
    ## Wild_boar             "L"    "G"    "R"    "V"    "I"    "T"    "A"   
    ##                       [,302] [,303] [,304] [,305] [,306] [,307] [,308]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "L"    "X"    "E"    "R"    "T"    "P"    "H"   
    ## Red_Junglefowl        "L"    "V"    "E"    "R"    "A"    "P"    "A"   
    ## Westerned_Clawed_Frog "L"    "V"    "E"    "R"    "A"    "P"    "H"   
    ## Fathead_Minnow        "L"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "V"    "E"    "R"    "T"    "P"    "H"   
    ## Wild_boar             "L"    "V"    "E"    "R"    "T"    "P"    "H"   
    ##                       [,309] [,310] [,311] [,312] [,313] [,314] [,315]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "I"    "P"    "Y"    "R"    "X"    "S"    "K"   
    ## Red_Junglefowl        "Y"    "S"    "I"    "Q"    "E"    "S"    "-"   
    ## Westerned_Clawed_Frog "I"    "P"    "Y"    "R"    "E"    "S"    "K"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "P"    "Y"    "R"    "E"    "S"    "K"   
    ## Wild_boar             "V"    "P"    "Y"    "R"    "E"    "S"    "K"   
    ##                       [,316] [,317] [,318] [,319] [,320] [,321] [,322]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "L"    "T"    "R"    "I"    "L"    "Q"    "X"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "L"    "T"    "R"    "I"    "L"    "Q"    "D"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "T"    "R"    "I"    "L"    "Q"    "D"   
    ## Wild_boar             "L"    "T"    "R"    "I"    "L"    "Q"    "D"   
    ##                       [,323] [,324] [,325] [,326] [,327] [,328] [,329]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "S"    "L"    "G"    "X"    "X"    "T"    "K"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "S"    "L"    "G"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "S"    "L"    "G"    "G"    "R"    "T"    "R"   
    ## Wild_boar             "S"    "L"    "G"    "G"    "R"    "T"    "R"   
    ##                       [,330] [,331] [,332] [,333] [,334] [,335] [,336]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "T"    "S"    "I"    "I"    "A"    "T"    "X"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "T"    "S"    "I"    "I"    "A"    "T"    "I"   
    ## Wild_boar             "T"    "S"    "I"    "I"    "A"    "T"    "I"   
    ##                       [,337] [,338] [,339] [,340] [,341] [,342] [,343]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "S"    "P"    "A"    "S"    "I"    "N"    "X"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "S"    "P"    "A"    "S"    "L"    "N"    "L"   
    ## Wild_boar             "S"    "P"    "A"    "S"    "L"    "N"    "L"   
    ##                       [,344] [,345] [,346] [,347] [,348] [,349] [,350]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "E"    "E"    "T"    "L"    "S"    "T"    "L"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "E"    "T"    "L"    "S"    "T"    "L"   
    ## Wild_boar             "E"    "E"    "T"    "L"    "S"    "T"    "L"   
    ##                       [,351] [,352] [,353] [,354] [,355] [,356] [,357]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "X"    "Y"    "A"    "Y"    "R"    "A"    "K"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "Y"    "A"    "H"    "R"    "A"    "K"   
    ## Wild_boar             "E"    "Y"    "A"    "H"    "R"    "A"    "K"   
    ##                       [,358] [,359] [,360] [,361] [,362] [,363] [,364]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "N"    "I"    "M"    "N"    "K"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "N"    "I"    "L"    "N"    "K"    "P"    "E"   
    ## Wild_boar             "N"    "I"    "L"    "N"    "K"    "P"    "E"   
    ##                       [,365] [,366] [,367] [,368] [,369] [,370] [,371]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "N"    "Q"    "K"    "L"    "T"    "K"   
    ## Wild_boar             "V"    "N"    "Q"    "K"    "L"    "T"    "K"   
    ##                       [,372] [,373] [,374] [,375] [,376] [,377] [,378]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "A"    "L"    "I"    "K"    "E"    "Y"   
    ## Wild_boar             "K"    "A"    "L"    "I"    "K"    "E"    "Y"   
    ##                       [,379] [,380] [,381] [,382] [,383] [,384] [,385]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "T"    "E"    "E"    "I"    "E"    "R"    "L"   
    ## Wild_boar             "T"    "E"    "E"    "I"    "E"    "R"    "L"   
    ##                       [,386] [,387] [,388] [,389] [,390] [,391] [,392]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "R"    "D"    "L"    "A"    "A"    "A"   
    ## Wild_boar             "K"    "R"    "D"    "L"    "A"    "A"    "A"   
    ##                       [,393] [,394] [,395] [,396] [,397] [,398] [,399]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "R"    "E"    "K"    "N"    "G"    "V"    "Y"   
    ## Wild_boar             "R"    "E"    "K"    "N"    "G"    "V"    "Y"   
    ##                       [,400] [,401] [,402] [,403] [,404] [,405] [,406]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "S"    "E"    "E"    "N"    "F"    "R"   
    ## Wild_boar             "I"    "S"    "E"    "E"    "N"    "F"    "R"   
    ##                       [,407] [,408] [,409] [,410] [,411] [,412] [,413]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "M"    "S"    "G"    "K"    "L"    "T"   
    ## Wild_boar             "A"    "M"    "S"    "G"    "K"    "L"    "T"   
    ##                       [,414] [,415] [,416] [,417] [,418] [,419] [,420]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "Q"    "E"    "E"    "Q"    "I"    "V"   
    ## Wild_boar             "V"    "Q"    "E"    "E"    "Q"    "I"    "V"   
    ##                       [,421] [,422] [,423] [,424] [,425] [,426] [,427]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "L"    "I"    "E"    "K"    "I"    "G"   
    ## Wild_boar             "E"    "L"    "V"    "E"    "K"    "I"    "A"   
    ##                       [,428] [,429] [,430] [,431] [,432] [,433] [,434]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "A"    "V"    "E"    "E"    "E"    "L"    "N"   
    ## Wild_boar             "A"    "I"    "A"    "E"    "E"    "L"    "N"   
    ##                       [,435] [,436] [,437] [,438] [,439] [,440] [,441]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "R"    "V"    "T"    "E"    "L"    "F"    "M"   
    ## Wild_boar             "R"    "V"    "T"    "E"    "L"    "F"    "M"   
    ##                       [,442] [,443] [,444] [,445] [,446] [,447] [,448]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "D"    "N"    "K"    "N"    "E"    "L"    "D"   
    ## Wild_boar             "D"    "N"    "K"    "N"    "E"    "L"    "D"   
    ##                       [,449] [,450] [,451] [,452] [,453] [,454] [,455]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "Q"    "C"    "K"    "S"    "D"    "L"    "Q"   
    ## Wild_boar             "Q"    "C"    "K"    "S"    "D"    "L"    "Q"   
    ##                       [,456] [,457] [,458] [,459] [,460] [,461] [,462]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "N"    "K"    "T"    "Q"    "E"    "L"    "E"   
    ## Wild_boar             "N"    "K"    "T"    "Q"    "E"    "L"    "-"   
    ##                       [,463] [,464] [,465] [,466] [,467] [,468] [,469]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "T"    "T"    "Q"    "K"    "H"    "L"    "Q"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,470] [,471] [,472] [,473] [,474] [,475] [,476]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "T"    "K"    "L"    "Q"    "L"    "V"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,477] [,478] [,479] [,480] [,481] [,482] [,483]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "E"    "E"    "Y"    "I"    "T"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,484] [,485] [,486] [,487] [,488] [,489] [,490]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "A"    "L"    "E"    "S"    "T"    "E"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,491] [,492] [,493] [,494] [,495] [,496] [,497]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "L"    "H"    "D"    "A"    "A"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,498] [,499] [,500] [,501] [,502] [,503] [,504]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "L"    "L"    "N"    "T"    "V"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,505] [,506] [,507] [,508] [,509] [,510] [,511]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "T"    "T"    "K"    "D"    "V"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,512] [,513] [,514] [,515] [,516] [,517] [,518]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "G"    "L"    "H"    "S"    "K"    "L"    "D"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,519] [,520] [,521] [,522] [,523] [,524] [,525]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "R"    "K"    "K"    "A"    "V"    "D"    "Q"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,526] [,527] [,528] [,529] [,530] [,531] [,532]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "H"    "N"    "A"    "E"    "A"    "Q"    "D"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,533] [,534] [,535] [,536] [,537] [,538] [,539]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "F"    "G"    "K"    "N"    "L"    "N"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,540] [,541] [,542] [,543] [,544] [,545] [,546]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "S"    "L"    "F"    "N"    "N"    "M"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,547] [,548] [,549] [,550] [,551] [,552] [,553]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "L"    "I"    "K"    "D"    "G"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,554] [,555] [,556] [,557] [,558] [,559] [,560]
    ## Korean_Cattle         "-"    "K"    "Q"    "K"    "A"    "M"    "L"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "S"    "K"    "Q"    "K"    "A"    "M"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,561] [,562] [,563] [,564] [,565] [,566] [,567]
    ## Korean_Cattle         "E"    "V"    "H"    "K"    "T"    "L"    "F"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "V"    "H"    "K"    "T"    "L"    "F"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,568] [,569] [,570] [,571] [,572] [,573] [,574]
    ## Korean_Cattle         "G"    "N"    "L"    "L"    "T"    "S"    "S"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "G"    "N"    "L"    "L"    "S"    "S"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,575] [,576] [,577] [,578] [,579] [,580] [,581]
    ## Korean_Cattle         "V"    "S"    "A"    "L"    "D"    "S"    "I"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "S"    "A"    "L"    "D"    "T"    "I"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,582] [,583] [,584] [,585] [,586] [,587] [,588]
    ## Korean_Cattle         "T"    "T"    "T"    "A"    "L"    "G"    "S"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "T"    "T"    "V"    "A"    "L"    "G"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,589] [,590] [,591] [,592] [,593] [,594] [,595]
    ## Korean_Cattle         "L"    "S"    "S"    "I"    "P"    "E"    "N"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "T"    "S"    "I"    "P"    "E"    "N"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,596] [,597] [,598] [,599] [,600] [,601] [,602]
    ## Korean_Cattle         "V"    "S"    "T"    "L"    "V"    "S"    "Q"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "S"    "T"    "H"    "V"    "S"    "Q"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,603] [,604] [,605] [,606] [,607] [,608] [,609]
    ## Korean_Cattle         "I"    "S"    "N"    "M"    "I"    "L"    "K"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "F"    "N"    "M"    "I"    "L"    "K"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,610] [,611] [,612] [,613] [,614] [,615] [,616]
    ## Korean_Cattle         "E"    "Q"    "S"    "L"    "A"    "A"    "E"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "Q"    "S"    "L"    "A"    "A"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,617] [,618] [,619] [,620] [,621] [,622] [,623]
    ## Korean_Cattle         "S"    "K"    "T"    "V"    "L"    "Q"    "G"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "S"    "K"    "T"    "V"    "L"    "Q"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,624] [,625] [,626] [,627] [,628] [,629] [,630]
    ## Korean_Cattle         "L"    "I"    "N"    "V"    "L"    "K"    "T"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "I"    "N"    "V"    "L"    "K"    "T"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,631] [,632] [,633] [,634] [,635] [,636] [,637]
    ## Korean_Cattle         "E"    "L"    "L"    "S"    "S"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "D"    "L"    "L"    "S"    "S"    "L"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,638] [,639] [,640] [,641] [,642] [,643] [,644]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "M"    "I"    "L"    "S"    "P"    "T"    "V"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,645] [,646] [,647] [,648] [,649] [,650] [,651]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "S"    "I"    "L"    "K"    "I"    "N"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,652] [,653] [,654] [,655] [,656] [,657] [,658]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "S"    "Q"    "L"    "K"    "H"    "I"    "F"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,659] [,660] [,661] [,662] [,663] [,664] [,665]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "T"    "S"    "L"    "T"    "V"    "A"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,666] [,667] [,668] [,669] [,670] [,671] [,672]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "D"    "K"    "I"    "E"    "D"    "Q"    "K"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,673] [,674] [,675] [,676] [,677] [,678] [,679]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "E"    "L"    "D"    "G"    "F"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,680] [,681] [,682] [,683] [,684] [,685] [,686]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "S"    "I"    "L"    "C"    "N"    "N"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,687] [,688] [,689] [,690] [,691] [,692] [,693]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "H"    "E"    "L"    "Q"    "E"    "N"    "T"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,694] [,695] [,696] [,697] [,698] [,699] [,700]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "C"    "S"    "L"    "V"    "E"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,701] [,702] [,703] [,704] [,705] [,706] [,707]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "Q"    "K"    "Q"    "C"    "G"    "N"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,708] [,709] [,710] [,711] [,712] [,713] [,714]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "T"    "E"    "D"    "L"    "K"    "T"    "I"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,715] [,716] [,717] [,718] [,719] [,720] [,721]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "Q"    "T"    "H"    "S"    "Q"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,722] [,723] [,724] [,725] [,726] [,727] [,728]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "C"    "K"    "L"    "M"    "N"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,729] [,730] [,731] [,732] [,733] [,734] [,735]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "W"    "T"    "E"    "R"    "F"    "C"    "A"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,736] [,737] [,738] [,739] [,740] [,741] [,742]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "E"    "E"    "K"    "C"    "E"    "N"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,743] [,744] [,745] [,746] [,747] [,748] [,749]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "Q"    "K"    "P"    "L"    "S"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,750] [,751] [,752] [,753] [,754] [,755] [,756]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "Q"    "E"    "N"    "I"    "Q"    "Q"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,757] [,758] [,759] [,760] [,761] [,762] [,763]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "S"    "K"    "D"    "I"    "V"    "N"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,764] [,765] [,766] [,767] [,768] [,769] [,770]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "M"    "T"    "F"    "H"    "S"    "Q"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,771] [,772] [,773] [,774] [,775] [,776] [,777]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "F"    "C"    "A"    "D"    "S"    "D"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,778] [,779] [,780] [,781] [,782] [,783] [,784]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "G"    "F"    "S"    "Q"    "E"    "L"    "R"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,785] [,786] [,787] [,788] [,789] [,790] [,791]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "N"    "F"    "N"    "Q"    "E"    "G"    "T"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,792] [,793] [,794] [,795] [,796] [,797] [,798]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "L"    "V"    "E"    "E"    "S"    "V"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,799] [,800] [,801] [,802] [,803] [,804] [,805]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "H"    "S"    "D"    "K"    "L"    "N"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,806] [,807] [,808] [,809] [,810] [,811] [,812]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "G"    "N"    "L"    "E"    "K"    "I"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,813] [,814] [,815] [,816] [,817] [,818] [,819]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "Q"    "E"    "T"    "E"    "Q"    "R"    "C"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,820] [,821] [,822] [,823] [,824] [,825] [,826]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "S"    "L"    "N"    "T"    "R"    "T"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,827] [,828] [,829] [,830] [,831] [,832] [,833]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "Y"    "F"    "S"    "E"    "Q"    "W"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,834] [,835] [,836] [,837] [,838] [,839] [,840]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "S"    "S"    "L"    "N"    "E"    "R"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,841] [,842] [,843] [,844] [,845] [,846] [,847]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "Q"    "E"    "L"    "H"    "N"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,848] [,849] [,850] [,851] [,852] [,853] [,854]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "L"    "E"    "V"    "V"    "S"    "Q"    "C"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,855] [,856] [,857] [,858] [,859] [,860] [,861]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "C"    "E"    "A"    "S"    "S"    "S"    "D"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,862] [,863] [,864] [,865] [,866] [,867] [,868]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "T"    "E"    "K"    "S"    "D"    "G"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,869] [,870] [,871] [,872] [,873] [,874] [,875]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "R"    "K"    "A"    "A"    "H"    "E"    "K"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,876] [,877] [,878] [,879] [,880] [,881] [,882]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "Q"    "H"    "N"    "I"    "F"    "L"    "D"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,883] [,884] [,885] [,886] [,887] [,888] [,889]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "Q"    "M"    "T"    "I"    "D"    "E"    "D"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,890] [,891] [,892] [,893] [,894] [,895] [,896]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "L"    "I"    "A"    "Q"    "N"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,897] [,898] [,899] [,900] [,901] [,902] [,903]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "L"    "N"    "E"    "T"    "I"    "K"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,904] [,905] [,906] [,907] [,908] [,909] [,910]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "I"    "G"    "L"    "T"    "K"    "L"    "N"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,911] [,912] [,913] [,914] [,915] [,916] [,917]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "C"    "F"    "L"    "E"    "Q"    "D"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,918] [,919] [,920] [,921] [,922] [,923] [,924]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "K"    "L"    "D"    "I"    "P"    "T"    "G"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,925] [,926] [,927] [,928] [,929] [,930] [,931]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "T"    "T"    "P"    "Q"    "R"    "K"    "S"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,932] [,933] [,934] [,935] [,936] [,937] [,938]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "Y"    "L"    "Y"    "P"    "S"    "T"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,939] [,940] [,941] [,942] [,943] [,944] [,945]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "V"    "R"    "T"    "E"    "P"    "R"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,946] [,947] [,948] [,949] [,950] [,951] [,952]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "H"    "L"    "L"    "D"    "Q"    "L"    "K"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,953] [,954] [,955] [,956] [,957] [,958] [,959]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "R"    "K"    "Q"    "P"    "E"    "L"    "L"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,960] [,961] [,962] [,963] [,964] [,965] [,966]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "M"    "M"    "L"    "N"    "C"    "S"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,967] [,968] [,969] [,970] [,971] [,972] [,973]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "N"    "N"    "K"    "E"    "E"    "T"    "I"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,974] [,975] [,976] [,977] [,978] [,979] [,980]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "P"    "D"    "V"    "D"    "V"    "E"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,981] [,982] [,983] [,984] [,985] [,986] [,987]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "A"    "V"    "L"    "G"    "Q"    "Y"    "T"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,988] [,989] [,990] [,991] [,992] [,993] [,994]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ## Human_KIF11           "E"    "E"    "P"    "L"    "S"    "Q"    "E"   
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"    "-"   
    ##                       [,995] [,996] [,997] [,998] [,999] [,1000] [,1001]
    ## Korean_Cattle         "-"    "-"    "-"    "-"    "-"    "-"     "-"    
    ## Fire_belly_newt       "-"    "-"    "-"    "-"    "-"    "-"     "-"    
    ## Red_Junglefowl        "-"    "-"    "-"    "-"    "-"    "-"     "-"    
    ## Westerned_Clawed_Frog "-"    "-"    "-"    "-"    "-"    "-"     "-"    
    ## Fathead_Minnow        "-"    "-"    "-"    "-"    "-"    "-"     "-"    
    ## House_mouse           "-"    "-"    "-"    "-"    "-"    "-"     "-"    
    ## Human_KIF11           "P"    "S"    "V"    "D"    "A"    "G"     "V"    
    ## Wild_boar             "-"    "-"    "-"    "-"    "-"    "-"     "-"    
    ##                       [,1002] [,1003] [,1004] [,1005] [,1006] [,1007]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "D"     "C"     "S"     "S"     "I"     "G"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1008] [,1009] [,1010] [,1011] [,1012] [,1013]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "G"     "V"     "P"     "F"     "F"     "Q"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1014] [,1015] [,1016] [,1017] [,1018] [,1019]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "H"     "K"     "K"     "S"     "H"     "G"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1020] [,1021] [,1022] [,1023] [,1024] [,1025]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "K"     "D"     "K"     "E"     "N"     "R"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1026] [,1027] [,1028] [,1029] [,1030] [,1031]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "G"     "I"     "N"     "T"     "L"     "E"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1032] [,1033] [,1034] [,1035] [,1036] [,1037]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "R"     "S"     "K"     "V"     "E"     "E"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1038] [,1039] [,1040] [,1041] [,1042] [,1043]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "T"     "T"     "E"     "H"     "L"     "V"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1044] [,1045] [,1046] [,1047] [,1048] [,1049]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "T"     "K"     "S"     "R"     "L"     "P"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1050] [,1051] [,1052] [,1053] [,1054] [,1055]
    ## Korean_Cattle         "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fire_belly_newt       "-"     "-"     "-"     "-"     "-"     "-"    
    ## Red_Junglefowl        "-"     "-"     "-"     "-"     "-"     "-"    
    ## Westerned_Clawed_Frog "-"     "-"     "-"     "-"     "-"     "-"    
    ## Fathead_Minnow        "-"     "-"     "-"     "-"     "-"     "-"    
    ## House_mouse           "-"     "-"     "-"     "-"     "-"     "-"    
    ## Human_KIF11           "L"     "R"     "A"     "Q"     "I"     "N"    
    ## Wild_boar             "-"     "-"     "-"     "-"     "-"     "-"    
    ##                       [,1056]
    ## Korean_Cattle         "-"    
    ## Fire_belly_newt       "-"    
    ## Red_Junglefowl        "-"    
    ## Westerned_Clawed_Frog "-"    
    ## Fathead_Minnow        "-"    
    ## House_mouse           "-"    
    ## Human_KIF11           "L"    
    ## Wild_boar             "-"    
    ## 
    ## $call
    ## read.fasta(file = "alignment.fst")

``` r
ids<-seqidentity(align)
data=as.matrix(ids)
```

``` r
pdf("~/Desktop/heatmap.pdf")
heatmap(data, margins = c(8,8), cexRow = 0.75, cexCol = 0.75)
```

``` r
consens<-consensus(align)
head(consens)
```

    ## $seq
    ##    [1] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##   [18] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##   [35] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##   [52] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "Y" "-" "-"
    ##   [69] "-" "-" "-" "F" "-" "-" "-" "-" "K" "Q" "I" "D" "V" "Y" "R" "S" "V"
    ##   [86] "V" "C" "P" "I" "L" "D" "E" "V" "I" "M" "G" "Y" "N" "C" "T" "-" "F"
    ##  [103] "A" "Y" "G" "Q" "T" "G" "T" "G" "K" "T" "F" "T" "M" "E" "G" "E" "R"
    ##  [120] "S" "P" "-" "E" "E" "-" "T" "W" "E" "E" "D" "P" "L" "A" "G" "I" "I"
    ##  [137] "P" "R" "T" "L" "H" "Q" "I" "F" "E" "K" "L" "-" "-" "N" "G" "T" "E"
    ##  [154] "F" "S" "V" "K" "V" "S" "L" "L" "E" "I" "Y" "N" "E" "E" "L" "F" "D"
    ##  [171] "L" "L" "S" "P" "-" "-" "D" "V" "-" "E" "R" "L" "Q" "M" "F" "D" "D"
    ##  [188] "P" "R" "N" "K" "R" "G" "V" "I" "I" "K" "G" "L" "E" "E" "-" "T" "V"
    ##  [205] "H" "N" "K" "-" "E" "V" "Y" "Q" "I" "L" "E" "R" "G" "A" "A" "K" "R"
    ##  [222] "T" "T" "A" "A" "T" "L" "M" "N" "A" "Y" "S" "S" "R" "S" "H" "S" "V"
    ##  [239] "F" "S" "V" "T" "I" "H" "M" "K" "E" "T" "T" "-" "D" "G" "E" "E" "L"
    ##  [256] "V" "K" "I" "G" "K" "L" "N" "L" "V" "D" "L" "A" "G" "S" "E" "N" "I"
    ##  [273] "G" "R" "S" "G" "A" "V" "D" "K" "R" "A" "R" "E" "A" "G" "N" "I" "N"
    ##  [290] "Q" "S" "L" "L" "T" "L" "G" "R" "V" "I" "-" "A" "L" "-" "E" "R" "-"
    ##  [307] "P" "-" "-" "-" "-" "-" "-" "S" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [324] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [341] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [358] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [375] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [392] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [409] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [426] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [443] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [460] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [477] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [494] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [511] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [528] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [545] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [562] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [579] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [596] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [613] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [630] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [647] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [664] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [681] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [698] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [715] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [732] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [749] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [766] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [783] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [800] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [817] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [834] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [851] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [868] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [885] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [902] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [919] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [936] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [953] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [970] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ##  [987] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ## [1004] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ## [1021] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ## [1038] "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-" "-"
    ## [1055] "-" "-"
    ## 
    ## $freq
    ##       1    2     3     4     5     6     7     8     9    10   11    12
    ## V 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## I 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.00 0.000
    ## L 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.00 0.000
    ## M 0.125 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## F 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## W 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## Y 0.125 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## S 0.000 0.00 0.125 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.00 0.000
    ## T 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## N 0.000 0.00 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.125 0.00 0.000
    ## Q 0.000 0.00 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## H 0.000 0.00 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## K 0.000 0.00 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.25 0.125
    ## R 0.000 0.00 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## D 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## E 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## A 0.000 0.25 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.00 0.000
    ## G 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## P 0.000 0.00 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.00 0.125
    ## C 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ## - 0.750 0.75 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.75 0.750
    ## X 0.000 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000
    ##     13    14    15    16    17   18   19   20   21   22   23   24   25
    ## V 0.00 0.125 0.000 0.000 0.000 0.00 0.00 0.00 0.25 0.25 0.25 0.00 0.00
    ## I 0.00 0.000 0.000 0.000 0.000 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00
    ## L 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## M 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## T 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## N 0.00 0.000 0.125 0.000 0.000 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Q 0.00 0.000 0.000 0.125 0.000 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00
    ## H 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.00 0.000 0.125 0.000 0.250 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## R 0.00 0.000 0.000 0.000 0.125 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## D 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.25 0.125 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## A 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## G 0.00 0.000 0.000 0.250 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25
    ## - 0.75 0.750 0.750 0.625 0.625 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.00 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##     26   27   28   29    30    31    32    33    34    35    36    37
    ## V 0.00 0.00 0.00 0.00 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## L 0.00 0.00 0.00 0.00 0.250 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## M 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.00 0.00 0.25 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.125
    ## T 0.00 0.00 0.00 0.00 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.00 0.00 0.00 0.25 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.00 0.00 0.00 0.00 0.000 0.000 0.125 0.125 0.250 0.000 0.000 0.125
    ## R 0.25 0.00 0.00 0.00 0.000 0.000 0.000 0.250 0.000 0.000 0.000 0.000
    ## D 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.00 0.00 0.00 0.00 0.000 0.000 0.250 0.000 0.000 0.000 0.000 0.000
    ## A 0.00 0.00 0.00 0.00 0.000 0.125 0.000 0.000 0.125 0.125 0.125 0.125
    ## G 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.00 0.25 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.75 0.75 0.75 0.75 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625
    ## X 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##      38    39    40    41    42    43    44    45    46   47    48    49
    ## V 0.000 0.000 0.125 0.250 0.000 0.000 0.000 0.000 0.125 0.00 0.000 0.000
    ## I 0.000 0.000 0.125 0.000 0.000 0.125 0.000 0.000 0.000 0.00 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.00 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## Y 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## S 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## T 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.00 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.00 0.000 0.000
    ## H 0.250 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.25 0.375 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.25 0.125 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.250 0.000 0.000 0.00 0.000 0.125
    ## E 0.125 0.000 0.000 0.125 0.375 0.000 0.125 0.000 0.000 0.00 0.000 0.375
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.00 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.250 0.000 0.000 0.000 0.00 0.000 0.000
    ## - 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.50 0.500 0.500
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000
    ##     50    51    52    53    54    55    56    57   58    59    60    61
    ## V 0.25 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## I 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## L 0.25 0.000 0.000 0.000 0.000 0.000 0.000 0.250 0.00 0.000 0.000 0.000
    ## M 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## F 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## W 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## Y 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## S 0.00 0.250 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.250
    ## T 0.00 0.125 0.000 0.000 0.375 0.000 0.000 0.000 0.25 0.000 0.000 0.125
    ## N 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## Q 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## H 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## K 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.375 0.000
    ## R 0.00 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.00 0.000 0.125 0.000
    ## D 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.375 0.000 0.000
    ## E 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.125
    ## A 0.00 0.125 0.000 0.000 0.000 0.125 0.000 0.125 0.25 0.125 0.000 0.000
    ## G 0.00 0.000 0.000 0.000 0.000 0.250 0.375 0.000 0.00 0.000 0.000 0.000
    ## P 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## C 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ## - 0.50 0.500 0.625 0.625 0.625 0.625 0.625 0.625 0.50 0.500 0.500 0.500
    ## X 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000
    ##      62    63    64    65    66    67    68    69    70    71   72   73
    ## V 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.500 0.00 0.00
    ## I 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.00 0.00
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.500 0.000 0.00 0.00
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.500 0.000 0.000 0.000 0.75 0.00
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## Y 0.000 0.000 0.000 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## S 0.375 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.00 0.00
    ## T 0.000 0.000 0.000 0.500 0.000 0.500 0.000 0.000 0.000 0.000 0.00 0.00
    ## N 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.00 0.00
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## K 0.125 0.250 0.500 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## R 0.000 0.250 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.25
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.500 0.000 0.000 0.00 0.00
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.00 0.00
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## G 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.50
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ## - 0.500 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.25 0.25
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00
    ##     74    75    76    77    78    79    80   81    82    83    84    85
    ## V 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.75 0.000 0.000 0.000 0.625
    ## I 0.00 0.000 0.000 0.000 0.000 0.625 0.000 0.00 0.000 0.000 0.000 0.000
    ## L 0.00 0.000 0.000 0.000 0.000 0.125 0.000 0.00 0.000 0.000 0.000 0.000
    ## M 0.00 0.125 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## F 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## W 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## Y 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.625 0.000 0.000 0.000
    ## S 0.00 0.375 0.125 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.625 0.000
    ## T 0.00 0.000 0.250 0.000 0.000 0.000 0.125 0.00 0.000 0.000 0.000 0.000
    ## N 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## Q 0.00 0.125 0.000 0.000 0.625 0.000 0.000 0.00 0.125 0.000 0.000 0.125
    ## H 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## K 0.00 0.000 0.000 0.625 0.125 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## R 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.625 0.000 0.000
    ## D 0.00 0.000 0.000 0.000 0.000 0.000 0.625 0.00 0.000 0.000 0.000 0.000
    ## E 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.125 0.125 0.000
    ## A 0.50 0.125 0.375 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## G 0.00 0.000 0.000 0.125 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## P 0.25 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## C 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ## - 0.25 0.250 0.250 0.250 0.250 0.250 0.250 0.25 0.250 0.250 0.250 0.250
    ## X 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000
    ##      86    87    88    89    90    91    92    93    94    95    96    97
    ## V 0.625 0.125 0.000 0.000 0.125 0.000 0.000 0.625 0.000 0.000 0.000 0.000
    ## I 0.125 0.000 0.000 0.625 0.000 0.000 0.000 0.125 0.625 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.125 0.625 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.625 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.625
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.125 0.000 0.000 0.125 0.625 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.625 0.000
    ## P 0.000 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.375 0.375 0.375
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##      98    99   100   101   102   103   104   105   106   107   108   109
    ## V 0.000 0.000 0.000 0.250 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.625 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.000 0.625 0.000 0.625
    ## N 0.625 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.625 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.625 0.000 0.000 0.625 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.625 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     110   111   112   113   114   115  116   117   118   119   120   121
    ## V 0.000 0.000 0.000 0.000 0.000 0.125 0.00 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.125 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.625 0.00 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.625 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.625 0.000
    ## T 0.000 0.000 0.625 0.000 0.625 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.125 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.625 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.625 0.000 0.125
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.125 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.75 0.125 0.625 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.125 0.000 0.00 0.000 0.000 0.000 0.125 0.125
    ## G 0.625 0.000 0.000 0.000 0.000 0.000 0.00 0.625 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.625
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ## - 0.375 0.375 0.375 0.375 0.250 0.250 0.25 0.250 0.250 0.250 0.125 0.125
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.000 0.000 0.000 0.000 0.000
    ##     122   123   124   125   126   127   128   129   130   131   132   133
    ## V 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.125
    ## M 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.375 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## T 0.000 0.125 0.000 0.000 0.750 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.500 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.250 0.000 0.000 0.000 0.000 0.000 0.250 0.000 0.750 0.000 0.000 0.000
    ## E 0.000 0.625 0.750 0.000 0.000 0.000 0.625 0.625 0.000 0.000 0.125 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750
    ## G 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     134   135   136   137   138   139   140   141   142   143   144   145
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.750 0.750 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000 0.125 0.000
    ## N 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.750 0.000 0.000 0.125
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.750 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     146   147   148   149  150  151   152   153   154   155   156   157
    ## V 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.750 0.000
    ## I 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.875 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.125 0.000
    ## M 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.750 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.375 0.000 0.00 0.00 0.000 0.000 0.000 0.750 0.000 0.000
    ## T 0.000 0.000 0.375 0.125 0.00 0.00 0.875 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.125 0.75 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.125 0.000 0.125 0.000 0.125
    ## H 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.750 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.750
    ## R 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.125 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.250 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.125 0.000 0.125 0.375 0.00 0.00 0.000 0.750 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.00 0.75 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.125 0.125 0.125 0.125 0.25 0.25 0.125 0.125 0.125 0.125 0.125 0.125
    ## X 0.000 0.000 0.000 0.000 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000
    ##     158   159   160   161   162   163   164   165   166   167   168  169
    ## V 0.750 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.00
    ## I 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000 0.000 0.00
    ## L 0.000 0.000 0.750 0.875 0.000 0.125 0.000 0.000 0.000 0.000 0.750 0.00
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.75
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.125 0.00
    ## S 0.000 0.750 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## T 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.00
    ## Q 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## K 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## E 0.125 0.000 0.000 0.000 0.750 0.000 0.000 0.125 0.875 0.875 0.000 0.00
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ## - 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.25
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.00
    ##    170   171   172   173   174   175   176   177   178   179   180   181
    ## V 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000
    ## I 0.00 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.00 0.750 0.750 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.00 0.000 0.000 0.625 0.000 0.375 0.250 0.125 0.000 0.250 0.000 0.000
    ## T 0.00 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000
    ## N 0.00 0.000 0.000 0.250 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## Q 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875
    ## D 0.75 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000
    ## E 0.00 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125 0.875 0.000
    ## A 0.00 0.000 0.000 0.000 0.125 0.250 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.250 0.000 0.000
    ## P 0.00 0.000 0.000 0.000 0.750 0.000 0.500 0.000 0.000 0.000 0.000 0.000
    ## C 0.00 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.25 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125
    ## X 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     182   183   184  185  186  187  188  189 190   191   192   193   194
    ## V 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.875
    ## I 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## L 0.875 0.000 0.125 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.625 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.75 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   1 0.000 0.000 0.125 0.000
    ## Q 0.000 0.750 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## H 0.000 0.125 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.875 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.75   0 0.000 0.875 0.000 0.125
    ## D 0.000 0.000 0.000 0.00 0.75 0.75 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.125 0.125 0.000 0.000
    ## G 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.875 0.000
    ## P 0.000 0.000 0.000 0.00 0.00 0.00 0.75 0.00   0 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ## - 0.125 0.125 0.250 0.25 0.25 0.25 0.25 0.25   0 0.000 0.000 0.000 0.000
    ## X 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00   0 0.000 0.000 0.000 0.000
    ##     195   196   197   198   199 200 201   202   203   204   205   206
    ## V 0.000 0.000 0.000 0.000 0.125   0   0 0.500 0.000 0.875 0.000 0.000
    ## I 0.750 0.875 0.000 0.000 0.000   0   0 0.375 0.000 0.000 0.000 0.000
    ## L 0.125 0.125 0.000 0.000 0.875   0   0 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.125 0.000 0.000 0.000
    ## T 0.125 0.000 0.000 0.125 0.000   0   0 0.000 0.875 0.125 0.000 0.000
    ## N 0.000 0.000 0.125 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.875
    ## Q 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.875 0.000
    ## K 0.000 0.000 0.875 0.000 0.000   0   0 0.000 0.000 0.000 0.125 0.000
    ## R 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.125
    ## E 0.000 0.000 0.000 0.000 0.000   1   1 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.875 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ## - 0.000 0.000 0.000 0.000 0.000   0   0 0.125 0.000 0.000 0.000 0.000
    ## X 0.000 0.000 0.000 0.000 0.000   0   0 0.000 0.000 0.000 0.000 0.000
    ##     207   208   209   210   211   212   213 214   215   216   217   218
    ## V 0.125 0.000 0.000 0.875 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.875   0 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.125 0.000 0.000 0.000   1 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## F 0.000 0.125 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.875 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.125 0.000   0 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## N 0.000 0.500 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.750 0.000   0 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.125 0.125 0.000   0 0.000 0.000 0.000 0.000
    ## K 0.875 0.000 0.000 0.000 0.000 0.000 0.125   0 0.000 0.375 0.125 0.125
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.625 0.000 0.000
    ## D 0.000 0.375 0.000 0.000 0.000 0.000 0.000   0 0.125 0.000 0.000 0.000
    ## E 0.000 0.000 0.875 0.000 0.000 0.000 0.000   0 0.875 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.875
    ## G 0.000 0.000 0.125 0.000 0.000 0.000 0.000   0 0.000 0.000 0.875 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## - 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000 0.000 0.000 0.000
    ##   219   220   221   222   223   224   225   226   227   228   229   230
    ## V   0 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## I   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000
    ## M   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875 0.000 0.000
    ## F   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## S   0 0.000 0.000 0.000 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000
    ## T   0 0.000 0.000 0.625 0.875 0.000 0.000 0.875 0.000 0.000 0.000 0.000
    ## N   0 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.875 0.000
    ## Q   0 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## H   0 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K   0 0.750 0.000 0.250 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R   0 0.125 0.875 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D   0 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## E   0 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## A   1 0.000 0.000 0.000 0.000 0.875 0.625 0.000 0.125 0.000 0.000 0.875
    ## G   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## -   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## X   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     231   232   233   234   235   236 237   238 239   240   241   242
    ## V 0.000 0.000 0.000 0.000 0.000 0.000   0 0.875   0 0.000 0.750 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.125 0.000
    ## L 0.000 0.000 0.000 0.000 0.125 0.000   0 0.125   0 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## F 0.125 0.000 0.000 0.000 0.000 0.000   0 0.000   1 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## Y 0.875 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## S 0.000 0.875 0.875 0.000 0.875 0.000   1 0.000   0 0.875 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.875
    ## N 0.000 0.000 0.000 0.125 0.000 0.125   0 0.000   0 0.125 0.000 0.000
    ## Q 0.000 0.000 0.125 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.875   0 0.000   0 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.875 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## G 0.000 0.125 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ## - 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.125 0.125
    ## X 0.000 0.000 0.000 0.000 0.000 0.000   0 0.000   0 0.000 0.000 0.000
    ##     243   244   245   246   247   248   249   250   251   252 253 254 255
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.500 0.000 0.000   0   0   0
    ## I 0.875 0.000 0.000 0.000 0.000 0.125 0.000 0.250 0.000 0.000   0   0   0
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000   0   0   1
    ## M 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000 0.000 0.125   0   0   0
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## T 0.000 0.000 0.000 0.000 0.000 0.750 0.875 0.000 0.000 0.000   0   0   0
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000   0   0   0
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## H 0.000 0.875 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## K 0.000 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875 0.000   0   0   0
    ## E 0.000 0.000 0.000 0.000 0.750 0.000 0.000 0.000 0.000 0.000   1   1   0
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875   0   0   0
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000   0   0   0
    ## - 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.000 0.000   0   0   0
    ## X 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000   0   0   0
    ##     256 257   258 259   260   261   262   263   264   265   266   267
    ## V 0.875   0 0.000   0 0.000 0.000 0.000 0.000 0.875 0.000 0.000 0.000
    ## I 0.125   0 0.750   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000   0 0.000   0 0.000 0.875 0.000 0.875 0.000 0.000 0.875 0.000
    ## M 0.000   0 0.000   0 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000   0 0.000   0 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000   0 0.000   0 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000   1 0.000   0 0.875 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000   0 0.125   0 0.000 0.000 0.000 0.000 0.000 0.750 0.000 0.000
    ## E 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875
    ## G 0.000   0 0.000   1 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000   0 0.000   0 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.000   0 0.000   0 0.000 0.000 0.125 0.125 0.125 0.125 0.125 0.125
    ## X 0.000   0 0.125   0 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ##     268   269   270   271   272   273   274   275   276   277   278   279
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875 0.000
    ## I 0.000 0.000 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.875 0.000 0.000 0.000 0.000 0.000 0.875 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875
    ## E 0.000 0.000 0.875 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.875 0.000 0.000
    ## G 0.875 0.000 0.000 0.000 0.000 0.875 0.000 0.000 0.875 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     280   281   282   283   284   285  286  287  288  289  290  291  292
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.75 0.00 0.00 0.00 0.00
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.75
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.75 0.00
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.75 0.00 0.75 0.00 0.00 0.00
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.75 0.00 0.00
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.875 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## R 0.000 0.875 0.000 0.875 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.000 0.000 0.000 0.000 0.875 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## A 0.000 0.000 0.875 0.000 0.000 0.875 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.75 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## - 0.125 0.125 0.125 0.125 0.125 0.125 0.25 0.25 0.25 0.25 0.25 0.25 0.25
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    293  294  295  296  297  298  299   300  301  302   303   304   305
    ## V 0.00 0.00 0.00 0.00 0.00 0.75 0.00 0.000 0.00 0.00 0.500 0.000 0.000
    ## I 0.00 0.00 0.00 0.00 0.00 0.00 0.75 0.000 0.00 0.00 0.000 0.000 0.000
    ## L 0.75 0.00 0.75 0.00 0.00 0.00 0.00 0.000 0.00 0.75 0.000 0.000 0.000
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00 0.000 0.000 0.000
    ## T 0.00 0.75 0.00 0.00 0.00 0.00 0.00 0.500 0.00 0.00 0.000 0.000 0.000
    ## N 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## Q 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## K 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00 0.000 0.000 0.000
    ## R 0.00 0.00 0.00 0.00 0.75 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.625
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## E 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.625 0.000
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.75 0.00 0.000 0.000 0.000
    ## G 0.00 0.00 0.00 0.75 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.000 0.000 0.000
    ## - 0.25 0.25 0.25 0.25 0.25 0.25 0.25 0.250 0.25 0.25 0.375 0.375 0.375
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.125 0.000 0.000
    ##     306   307   308   309   310   311   312   313   314 315 316 317 318
    ## V 0.000 0.000 0.000 0.250 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## I 0.000 0.000 0.000 0.250 0.000 0.125 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.5 0.0 0.0
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## Y 0.000 0.000 0.000 0.125 0.000 0.500 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## S 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.625 0.0 0.0 0.0 0.0
    ## T 0.375 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.5 0.0
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.0 0.0 0.0 0.0
    ## H 0.000 0.000 0.500 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.5 0.0 0.0 0.0
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.500 0.000 0.000 0.0 0.0 0.0 0.5
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.500 0.000 0.0 0.0 0.0 0.0
    ## A 0.250 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## P 0.000 0.625 0.000 0.000 0.500 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.0 0.0 0.0 0.0
    ## - 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.375 0.5 0.5 0.5 0.5
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.0 0.0 0.0 0.0
    ##   319 320 321   322 323 324 325   326   327   328   329   330   331   332
    ## V 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.5 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.375
    ## L 0.0 0.5 0.0 0.000 0.0 0.5 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.0 0.0 0.0 0.000 0.5 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.375 0.000
    ## T 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.375 0.000 0.375 0.000 0.000
    ## N 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.0 0.0 0.5 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## R 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.250 0.000 0.250 0.000 0.000 0.000
    ## D 0.0 0.0 0.0 0.375 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.0 0.0 0.0 0.000 0.0 0.0 0.5 0.250 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.0 0.0 0.0 0.000 0.0 0.0 0.0 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.5 0.5 0.5 0.500 0.5 0.5 0.5 0.625 0.625 0.625 0.625 0.625 0.625 0.625
    ## X 0.0 0.0 0.0 0.125 0.0 0.0 0.0 0.125 0.125 0.000 0.000 0.000 0.000 0.000
    ##     333   334   335   336   337   338   339   340   341   342   343   344
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.375 0.000 0.000 0.250 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.250 0.000 0.250 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.375 0.000 0.000 0.375 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.375 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.375
    ## A 0.000 0.375 0.000 0.000 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625
    ## X 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ##     345   346   347   348   349   350   351   352   353   354   355   356
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.375 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.375 0.000 0.125 0.000 0.000
    ## S 0.000 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.375 0.000 0.000 0.375 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.250 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.375 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.375 0.000 0.000 0.000 0.000 0.000 0.250 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.375 0.000 0.000 0.375
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ##     357   358   359   360   361   362  363  364  365  366  367  368  369
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.25 0.00 0.00 0.00 0.00
    ## I 0.000 0.000 0.375 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## L 0.000 0.000 0.000 0.250 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.25
    ## M 0.000 0.000 0.000 0.125 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## N 0.000 0.375 0.000 0.000 0.375 0.000 0.00 0.00 0.00 0.25 0.00 0.00 0.00
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.25 0.00 0.00
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.375 0.000 0.000 0.000 0.000 0.375 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.25 0.00 0.00 0.00 0.00 0.00
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.25 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## - 0.625 0.625 0.625 0.625 0.625 0.625 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    370  371  372  373  374  375  376  377  378  379  380  381  382  383
    ## V 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## I 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## L 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## T 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00
    ## N 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Q 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.00 0.25 0.25 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.25 0.25 0.00 0.25
    ## A 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    384  385  386  387  388  389  390  391  392  393  394  395  396  397
    ## V 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## I 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## L 0.00 0.25 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## T 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## N 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## Q 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00
    ## R 0.25 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00
    ## D 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.25 0.25 0.00 0.00 0.00 0.00 0.00
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    398  399  400  401  402  403  404  405  406   407  408  409  410  411
    ## V 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00
    ## I 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## L 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.25 0.00 0.00 0.00
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.000 0.00 0.00 0.00 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## Y 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## S 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.25 0.00 0.00
    ## T 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## N 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## Q 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## K 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.25
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.000 0.00 0.00 0.00 0.00
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## E 0.00 0.00 0.00 0.00 0.25 0.25 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.25 0.00
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.750 0.75 0.75 0.75 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00
    ##    412  413  414  415  416  417  418  419  420  421  422   423  424  425
    ## V 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.125 0.00 0.00
    ## I 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.125 0.00 0.00
    ## L 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.000 0.00 0.00
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## T 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## N 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## Q 0.00 0.00 0.00 0.25 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## K 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.25
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## E 0.00 0.00 0.00 0.00 0.25 0.25 0.00 0.00 0.00 0.25 0.00 0.000 0.25 0.00
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.750 0.75 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ##    426   427  428   429   430  431  432  433  434  435  436  437  438  439
    ## V 0.00 0.000 0.00 0.125 0.000 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00
    ## I 0.25 0.000 0.00 0.125 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## L 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.25
    ## M 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## T 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00
    ## N 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00
    ## Q 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## H 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## R 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00
    ## D 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.00 0.000 0.00 0.000 0.125 0.25 0.25 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## A 0.00 0.125 0.25 0.000 0.125 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## G 0.00 0.125 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## - 0.75 0.750 0.75 0.750 0.750 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.00 0.000 0.00 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    440  441  442  443  444  445  446  447  448  449  450  451  452  453
    ## V 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## I 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## L 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00
    ## M 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## T 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## N 0.00 0.00 0.00 0.25 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Q 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## D 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.25
    ## E 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    454  455  456  457  458  459  460  461   462   463   464   465   466
    ## V 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## I 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## L 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.000 0.000 0.000 0.000 0.000
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## T 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.000 0.125 0.125 0.000 0.000
    ## N 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## Q 0.00 0.25 0.00 0.00 0.00 0.25 0.00 0.00 0.000 0.000 0.000 0.125 0.000
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## K 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.125
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## E 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.125 0.000 0.000 0.000 0.000
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.875 0.875 0.875 0.875 0.875
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.000 0.000 0.000 0.000
    ##     467   468   469   470   471   472   473   474   475   476   477   478
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## H 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     479   480   481   482   483   484   485   486   487   488   489   490
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     491   492   493   494   495   496   497   498   499   500   501   502
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     503   504   505   506   507   508   509   510   511   512   513   514
    ## V 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## K 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     515   516   517   518   519   520   521   522   523   524   525   526
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## K 0.000 0.125 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     527   528   529   530   531   532   533   534   535   536   537   538
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## Q 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     539   540   541   542   543   544   545   546   547   548   549   550
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## L 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.125 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     551   552   553   554  555  556  557  558  559  560  561  562  563
    ## V 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## I 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## L 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00
    ## M 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00
    ## F 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.000 0.000 0.125 0.125 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## T 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## N 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Q 0.000 0.000 0.000 0.000 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## H 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25
    ## K 0.000 0.000 0.000 0.000 0.25 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00
    ## R 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## D 0.125 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00
    ## A 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00
    ## G 0.000 0.125 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## - 0.875 0.875 0.875 0.875 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.000 0.000 0.000 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    564  565  566  567  568  569  570  571   572  573  574  575  576  577
    ## V 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.25 0.00 0.00
    ## I 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## L 0.00 0.00 0.25 0.00 0.00 0.00 0.25 0.25 0.000 0.00 0.00 0.00 0.00 0.00
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## F 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.25 0.25 0.00 0.25 0.00
    ## T 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00 0.00
    ## N 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## Q 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## K 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## E 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.25
    ## G 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.750 0.75 0.75 0.75 0.75 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00
    ##    578  579   580  581  582  583   584  585  586  587  588  589   590  591
    ## V 0.00 0.00 0.000 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## I 0.00 0.00 0.000 0.25 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## L 0.25 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.25 0.00 0.00 0.25 0.000 0.00
    ## M 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## F 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## W 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## Y 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## S 0.00 0.00 0.125 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.25 0.00 0.125 0.25
    ## T 0.00 0.00 0.125 0.00 0.25 0.25 0.125 0.00 0.00 0.00 0.00 0.00 0.125 0.00
    ## N 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## Q 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## H 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## K 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## R 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## D 0.00 0.25 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## E 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## A 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.25 0.00 0.00 0.00 0.00 0.000 0.00
    ## G 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.25 0.00 0.00 0.000 0.00
    ## P 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## C 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ## - 0.75 0.75 0.750 0.75 0.75 0.75 0.750 0.75 0.75 0.75 0.75 0.75 0.750 0.75
    ## X 0.00 0.00 0.000 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.000 0.00
    ##    592  593  594  595  596  597  598   599  600  601  602  603   604  605
    ## V 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.000 0.25 0.00 0.00 0.00 0.000 0.00
    ## I 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.25 0.000 0.00
    ## L 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00 0.000 0.00
    ## M 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.125 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## S 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.000 0.00 0.25 0.00 0.00 0.125 0.00
    ## T 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## N 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.25
    ## Q 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.25 0.00 0.000 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00 0.000 0.00
    ## K 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## E 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## P 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.750 0.75 0.75 0.75 0.75 0.750 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.000 0.00
    ##    606  607  608  609  610  611  612  613  614  615  616  617  618  619
    ## V 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## I 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## L 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00
    ## M 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## F 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## W 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Y 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## S 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.25 0.00 0.00
    ## T 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25
    ## N 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## Q 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## H 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## K 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.00
    ## R 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## D 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## E 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.00 0.00
    ## A 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.25 0.00 0.00 0.00 0.00
    ## G 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## P 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## C 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ## - 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.75
    ## X 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.00
    ##    620  621  622   623  624  625  626  627  628  629  630   631  632  633
    ## V 0.25 0.00 0.00 0.000 0.00 0.00 0.00 0.25 0.00 0.00 0.00 0.000 0.00 0.00
    ## I 0.00 0.00 0.00 0.000 0.00 0.25 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## L 0.00 0.25 0.00 0.000 0.25 0.00 0.00 0.00 0.25 0.00 0.00 0.000 0.25 0.25
    ## M 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## F 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## W 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## Y 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## S 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## T 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.25 0.000 0.00 0.00
    ## N 0.00 0.00 0.00 0.000 0.00 0.00 0.25 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## Q 0.00 0.00 0.25 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## H 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## K 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.25 0.00 0.000 0.00 0.00
    ## R 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## D 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00
    ## E 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.125 0.00 0.00
    ## A 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## G 0.00 0.00 0.00 0.125 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## P 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## C 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ## - 0.75 0.75 0.75 0.750 0.75 0.75 0.75 0.75 0.75 0.75 0.75 0.750 0.75 0.75
    ## X 0.00 0.00 0.00 0.000 0.00 0.00 0.00 0.00 0.00 0.00 0.00 0.000 0.00 0.00
    ##    634  635   636   637   638   639   640   641   642   643   644   645
    ## V 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125
    ## I 0.00 0.00 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.00 0.00 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## M 0.00 0.00 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.25 0.25 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## T 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## N 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.00 0.00 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## C 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.75 0.75 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.00 0.00 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     646   647   648   649   650   651   652   653   654   655   656   657
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.125 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## L 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## K 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     658   659   660   661   662   663   664   665   666   667   668   669
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## L 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.125 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     670   671   672   673   674   675   676   677   678   679   680   681
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## L 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     682   683   684   685   686   687   688   689   690   691   692   693
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## N 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     694   695   696   697   698   699   700   701   702   703   704   705
    ## V 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     706   707   708   709   710   711   712   713   714   715   716   717
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## L 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125
    ## N 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     718   719   720   721   722   723   724   725   726   727   728   729
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125 0.000 0.000 0.125 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## Q 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     730   731   732   733   734   735   736   737   738   739   740   741
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## R 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     742   743   744   745   746   747   748   749   750   751   752   753
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## I 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## Q 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     754   755   756   757   758   759   760   761   762   763   764   765
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## I 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## Q 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     766   767   768   769   770   771   772   773   774   775   776   777
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## T 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.125
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     778   779   780   781   782   783   784   785   786   787   788   789
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000
    ## Q 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     790   791   792   793   794   795   796   797   798   799   800   801
    ## V 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125
    ## T 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## K 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     802   803   804   805   806   807   808   809   810   811   812   813
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## L 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     814   815   816   817   818   819   820   821   822   823   824   825
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## T 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## Q 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.125 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     826   827   828   829   830   831   832   833   834   835   836   837
    ## V 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.125 0.000
    ## T 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     838   839   840   841   842   843   844   845   846   847   848   849
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125 0.125 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.125 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     850   851   852   853   854   855   856   857   858   859   860   861
    ## V 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.125 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     862   863   864   865   866   867   868   869   870   871   872   873
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## K 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     874   875   876   877   878   879   880   881   882   883   884   885
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## N 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## H 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## E 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     886   887   888   889   890   891   892   893   894   895   896   897
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     898   899   900   901   902   903   904   905   906   907   908   909
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## L 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## N 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     910   911   912   913   914   915   916   917   918   919   920   921
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## L 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000
    ## E 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     922   923   924   925   926   927   928   929   930   931   932   933
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## T 0.000 0.125 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.125 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     934   935   936   937   938   939   940   941   942   943   944   945
    ## V 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     946   947   948   949   950   951   952   953   954   955   956   957
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.125 0.125 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## H 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     958   959   960   961   962   963   964   965   966   967   968   969
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.125 0.125 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.125 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     970   971   972   973   974   975   976   977   978   979   980   981
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000
    ## E 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     982   983   984   985   986   987   988   989   990   991   992   993
    ## V 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##     994   995   996   997   998   999  1000  1001  1002  1003  1004  1005
    ## V 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## E 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##    1006  1007  1008  1009  1010  1011  1012  1013  1014  1015  1016  1017
    ## V 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.125 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##    1018  1019  1020  1021  1022  1023  1024  1025  1026  1027  1028  1029
    ## V 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000
    ## L 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##    1030  1031  1032  1033  1034  1035  1036  1037  1038  1039  1040  1041
    ## V 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## K 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.125 0.000 0.000 0.000 0.000 0.125 0.125 0.000 0.000 0.125 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##    1042  1043  1044  1045  1046  1047  1048  1049  1050  1051  1052  1053
    ## V 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## I 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## L 0.125 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.125 0.000 0.000 0.000
    ## M 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## F 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## W 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## S 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## T 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## N 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## Q 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125
    ## H 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## K 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## R 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.125 0.000 0.000
    ## D 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## E 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## A 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000
    ## G 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## P 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.125 0.000 0.000 0.000 0.000
    ## C 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ## - 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875
    ## X 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000 0.000
    ##    1054  1055  1056
    ## V 0.000 0.000 0.000
    ## I 0.125 0.000 0.000
    ## L 0.000 0.000 0.125
    ## M 0.000 0.000 0.000
    ## F 0.000 0.000 0.000
    ## W 0.000 0.000 0.000
    ## Y 0.000 0.000 0.000
    ## S 0.000 0.000 0.000
    ## T 0.000 0.000 0.000
    ## N 0.000 0.125 0.000
    ## Q 0.000 0.000 0.000
    ## H 0.000 0.000 0.000
    ## K 0.000 0.000 0.000
    ## R 0.000 0.000 0.000
    ## D 0.000 0.000 0.000
    ## E 0.000 0.000 0.000
    ## A 0.000 0.000 0.000
    ## G 0.000 0.000 0.000
    ## P 0.000 0.000 0.000
    ## C 0.000 0.000 0.000
    ## - 0.875 0.875 0.875
    ## X 0.000 0.000 0.000
    ## 
    ## $seq.freq
    ##     1     2     3     4     5     6     7     8     9    10    11    12 
    ## 0.125 0.250 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.250 0.125 
    ##    13    14    15    16    17    18    19    20    21    22    23    24 
    ## 0.250 0.125 0.125 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##    25    26    27    28    29    30    31    32    33    34    35    36 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.125 0.250 0.250 0.250 0.125 0.125 
    ##    37    38    39    40    41    42    43    44    45    46    47    48 
    ## 0.125 0.250 0.125 0.125 0.250 0.375 0.250 0.250 0.125 0.125 0.250 0.375 
    ##    49    50    51    52    53    54    55    56    57    58    59    60 
    ## 0.375 0.250 0.250 0.375 0.375 0.375 0.250 0.375 0.250 0.250 0.375 0.375 
    ##    61    62    63    64    65    66    67    68    69    70    71    72 
    ## 0.250 0.375 0.250 0.500 0.500 0.625 0.500 0.500 0.500 0.500 0.500 0.750 
    ##    73    74    75    76    77    78    79    80    81    82    83    84 
    ## 0.500 0.500 0.375 0.375 0.625 0.625 0.625 0.625 0.750 0.625 0.625 0.625 
    ##    85    86    87    88    89    90    91    92    93    94    95    96 
    ## 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.625 
    ##    97    98    99   100   101   102   103   104   105   106   107   108 
    ## 0.625 0.625 0.625 0.625 0.375 0.625 0.625 0.625 0.625 0.625 0.625 0.625 
    ##   109   110   111   112   113   114   115   116   117   118   119   120 
    ## 0.625 0.625 0.625 0.625 0.625 0.625 0.625 0.750 0.625 0.625 0.625 0.625 
    ##   121   122   123   124   125   126   127   128   129   130   131   132 
    ## 0.625 0.500 0.625 0.750 0.375 0.750 0.750 0.625 0.625 0.750 0.750 0.750 
    ##   133   134   135   136   137   138   139   140   141   142   143   144 
    ## 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.875 0.750 0.750 0.750 0.750 
    ##   145   146   147   148   149   150   151   152   153   154   155   156 
    ## 0.750 0.750 0.875 0.375 0.375 0.750 0.750 0.875 0.750 0.750 0.750 0.750 
    ##   157   158   159   160   161   162   163   164   165   166   167   168 
    ## 0.750 0.750 0.750 0.750 0.875 0.750 0.750 0.750 0.750 0.875 0.875 0.750 
    ##   169   170   171   172   173   174   175   176   177   178   179   180 
    ## 0.750 0.750 0.750 0.750 0.625 0.750 0.375 0.500 0.750 0.750 0.250 0.875 
    ##   181   182   183   184   185   186   187   188   189   190   191   192 
    ## 0.875 0.875 0.750 0.625 0.750 0.750 0.750 0.750 0.750 1.000 0.875 0.875 
    ##   193   194   195   196   197   198   199   200   201   202   203   204 
    ## 0.875 0.875 0.750 0.875 0.875 0.875 0.875 1.000 1.000 0.500 0.875 0.875 
    ##   205   206   207   208   209   210   211   212   213   214   215   216 
    ## 0.875 0.875 0.875 0.500 0.875 0.875 0.875 0.750 0.875 1.000 0.875 0.625 
    ##   217   218   219   220   221   222   223   224   225   226   227   228 
    ## 0.875 0.875 1.000 0.750 0.875 0.625 0.875 0.875 0.625 0.875 0.750 0.875 
    ##   229   230   231   232   233   234   235   236   237   238   239   240 
    ## 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 1.000 0.875 1.000 0.875 
    ##   241   242   243   244   245   246   247   248   249   250   251   252 
    ## 0.750 0.875 0.875 0.875 0.875 0.875 0.750 0.750 0.875 0.500 0.875 0.875 
    ##   253   254   255   256   257   258   259   260   261   262   263   264 
    ## 1.000 1.000 1.000 0.875 1.000 0.750 1.000 0.875 0.875 0.875 0.875 0.875 
    ##   265   266   267   268   269   270   271   272   273   274   275   276 
    ## 0.750 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 
    ##   277   278   279   280   281   282   283   284   285   286   287   288 
    ## 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.875 0.750 0.750 0.750 
    ##   289   290   291   292   293   294   295   296   297   298   299   300 
    ## 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.750 0.500 
    ##   301   302   303   304   305   306   307   308   309   310   311   312 
    ## 0.750 0.750 0.500 0.625 0.625 0.375 0.625 0.500 0.250 0.500 0.500 0.500 
    ##   313   314   315   316   317   318   319   320   321   322   323   324 
    ## 0.500 0.625 0.500 0.500 0.500 0.500 0.500 0.500 0.500 0.375 0.500 0.500 
    ##   325   326   327   328   329   330   331   332   333   334   335   336 
    ## 0.500 0.250 0.250 0.375 0.250 0.375 0.375 0.375 0.375 0.375 0.375 0.250 
    ##   337   338   339   340   341   342   343   344   345   346   347   348 
    ## 0.375 0.375 0.375 0.375 0.250 0.375 0.250 0.375 0.375 0.375 0.375 0.375 
    ##   349   350   351   352   353   354   355   356   357   358   359   360 
    ## 0.375 0.375 0.250 0.375 0.375 0.250 0.375 0.375 0.375 0.375 0.375 0.250 
    ##   361   362   363   364   365   366   367   368   369   370   371   372 
    ## 0.375 0.375 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   373   374   375   376   377   378   379   380   381   382   383   384 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   385   386   387   388   389   390   391   392   393   394   395   396 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   397   398   399   400   401   402   403   404   405   406   407   408 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.125 0.250 
    ##   409   410   411   412   413   414   415   416   417   418   419   420 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   421   422   423   424   425   426   427   428   429   430   431   432 
    ## 0.250 0.250 0.125 0.250 0.250 0.250 0.125 0.250 0.125 0.125 0.250 0.250 
    ##   433   434   435   436   437   438   439   440   441   442   443   444 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   445   446   447   448   449   450   451   452   453   454   455   456 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   457   458   459   460   461   462   463   464   465   466   467   468 
    ## 0.250 0.250 0.250 0.250 0.250 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   469   470   471   472   473   474   475   476   477   478   479   480 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   481   482   483   484   485   486   487   488   489   490   491   492 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   493   494   495   496   497   498   499   500   501   502   503   504 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   505   506   507   508   509   510   511   512   513   514   515   516 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   517   518   519   520   521   522   523   524   525   526   527   528 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   529   530   531   532   533   534   535   536   537   538   539   540 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   541   542   543   544   545   546   547   548   549   550   551   552 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   553   554   555   556   557   558   559   560   561   562   563   564 
    ## 0.125 0.125 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   565   566   567   568   569   570   571   572   573   574   575   576 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.125 0.250 0.250 0.250 0.250 
    ##   577   578   579   580   581   582   583   584   585   586   587   588 
    ## 0.250 0.250 0.250 0.125 0.250 0.250 0.250 0.125 0.250 0.250 0.250 0.250 
    ##   589   590   591   592   593   594   595   596   597   598   599   600 
    ## 0.250 0.125 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.125 0.250 
    ##   601   602   603   604   605   606   607   608   609   610   611   612 
    ## 0.250 0.250 0.250 0.125 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 
    ##   613   614   615   616   617   618   619   620   621   622   623   624 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.250 0.125 0.250 
    ##   625   626   627   628   629   630   631   632   633   634   635   636 
    ## 0.250 0.250 0.250 0.250 0.250 0.250 0.125 0.250 0.250 0.250 0.250 0.125 
    ##   637   638   639   640   641   642   643   644   645   646   647   648 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   649   650   651   652   653   654   655   656   657   658   659   660 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   661   662   663   664   665   666   667   668   669   670   671   672 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   673   674   675   676   677   678   679   680   681   682   683   684 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   685   686   687   688   689   690   691   692   693   694   695   696 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   697   698   699   700   701   702   703   704   705   706   707   708 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   709   710   711   712   713   714   715   716   717   718   719   720 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   721   722   723   724   725   726   727   728   729   730   731   732 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   733   734   735   736   737   738   739   740   741   742   743   744 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   745   746   747   748   749   750   751   752   753   754   755   756 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   757   758   759   760   761   762   763   764   765   766   767   768 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   769   770   771   772   773   774   775   776   777   778   779   780 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   781   782   783   784   785   786   787   788   789   790   791   792 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   793   794   795   796   797   798   799   800   801   802   803   804 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   805   806   807   808   809   810   811   812   813   814   815   816 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   817   818   819   820   821   822   823   824   825   826   827   828 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   829   830   831   832   833   834   835   836   837   838   839   840 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   841   842   843   844   845   846   847   848   849   850   851   852 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   853   854   855   856   857   858   859   860   861   862   863   864 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   865   866   867   868   869   870   871   872   873   874   875   876 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   877   878   879   880   881   882   883   884   885   886   887   888 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   889   890   891   892   893   894   895   896   897   898   899   900 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   901   902   903   904   905   906   907   908   909   910   911   912 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   913   914   915   916   917   918   919   920   921   922   923   924 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   925   926   927   928   929   930   931   932   933   934   935   936 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   937   938   939   940   941   942   943   944   945   946   947   948 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   949   950   951   952   953   954   955   956   957   958   959   960 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   961   962   963   964   965   966   967   968   969   970   971   972 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   973   974   975   976   977   978   979   980   981   982   983   984 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   985   986   987   988   989   990   991   992   993   994   995   996 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##   997   998   999  1000  1001  1002  1003  1004  1005  1006  1007  1008 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##  1009  1010  1011  1012  1013  1014  1015  1016  1017  1018  1019  1020 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##  1021  1022  1023  1024  1025  1026  1027  1028  1029  1030  1031  1032 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##  1033  1034  1035  1036  1037  1038  1039  1040  1041  1042  1043  1044 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ##  1045  1046  1047  1048  1049  1050  1051  1052  1053  1054  1055  1056 
    ## 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 0.125 
    ## 
    ## $cutoff
    ## [1] 0.6
