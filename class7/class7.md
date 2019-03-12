Class 7
================
Amber Fossier
1/29/19

Functions revist again
----------------------

``` r
source("http://tinyurl.com/rescale-R")
```

Lets try the rescale() function out

``` r
rescale(c(1,5,10))
```

    ## [1] 0.0000000 0.4444444 1.0000000

Lets try **rescale2()** with the **stop()** function catch for non-numeric input

``` r
x <-c(1,2,NA,3,NA)
y<-c(NA, 3, NA, 3, 4)
which (is.na(x))
```

    ## [1] 3 5

``` r
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

``` r
sum(is.na(x))
```

    ## [1] 2

``` r
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

``` r
is.na(y)
```

    ## [1]  TRUE FALSE  TRUE FALSE FALSE

``` r
is.na(x) & is.na(y)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

``` r
#putting together
sum( is.na(x) & is.na(y))
```

    ## [1] 1

take my working snipped and make our first function

``` r
#no further simplification necessary
both_na <- function(x, y) {
  sum( is.na(x) & is.na(y) )
}
x <-  c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)
y3 <- c( 1, NA, NA, NA, NA)

both_na(x,y1)
```

    ## [1] 2

``` r
#what will this return
both_na(x, y2)
```

    ## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
    ## shorter object length

    ## [1] 3

``` r
both_na(x,y3)
```

    ## Warning in is.na(x) & is.na(y): longer object length is not a multiple of
    ## shorter object length

    ## [1] 4
