<!-- README.md is generated from README.Rmd. Please edit that file -->
PACKAGE powers
==============

The goal of powers is to serve as the homework of STAT547M.

Functions Summary
-----------------

This package include following functions, - squre(): take the square of a vector; - boxcox(): take the boxcox transformations of a vector, - boxcox.inv(): take the inverse boxcox transformations of a vector, - na.filter(): filter out NA values by row or columns specified by the user for a dataset

Installation
------------

``` r
devtools::install_github("zxkathy/powers")
#> Skipping install of 'powers' from a github remote, the SHA1 (b5fdb9dc) has not changed since last install.
#>   Use `force = TRUE` to force installation
library(powers)
```

Quick Guide
-----------

#### 1. Function of `square()`

``` r
square(4)
#> [1] 16
square(c(1:3))
#> [1] 1 4 9
square(TRUE)
#> [1] 1
```

As we expected, the square function works well in the vector or number forms. Let's try another one.

``` r
square("x")
#> Error in pow(x, 2): Please input a numeric number or vector, or at least input a logical value!
m <- data.frame(cbind(c(1,2), c(3,4)))
class(m)
#> [1] "data.frame"
square(m)
#> Error in pow(x, 2): Please input a numeric number or vector, or at least input a logical value!
```

The square function only works in forms of vector of numeric, so it won't work for both str `"x"` and data.frame `m`.

#### 2. Function of `boxcox()` and `boxcox.inc()`

``` r
boxcox(2, lambda = 3)
#> [1] 2.333333
boxcox(1:3, lambda = 0)
#> [1] 0.0000000 0.6931472 1.0986123
```

``` r
boxcox.inv(2, lambda = 3)
#> [1] 0.4285714
boxcox.inv(1:3, lambda = 0)
#> [1]       Inf 1.4426950 0.9102392
```

The above `boxcox()` formula was obtained from the [link](http://onlinestatbook.com/2/transformations/box-cox.html). It doesn't specify the range of `lambda` and `x`, so when I get the case of boxcox result is 0, its inverse should be `Inf`.

Additionally, the above `boxcox.inv()` relies on the function of `boxcox()`. It basically just takes the inverse of the result of `boxcox()`.

``` r
boxcox(-1, 0)
#> Error in boxcox(-1, 0): Please input positive number!
```

As log(.) does not work for negative numbers, so I added a error point when the user's input of `x` is negative.

#### 3. Function of `filter.na()`

This function has two output, first one indicating whether the dataset contains any NA values, second one indicating the NA filtered dataset. User can specify how to remove the NA values, either by column or by row, as specified by the user.

``` r
a <- data.frame(cbind(c(1,2), c(NA, 3), c("m",7)))
class(a)
#> [1] "data.frame"
filter.na(a, direction = "row")
#> $ContainNA
#> [1] TRUE
#> 
#> $FilteredData
#>   X1 X2 X3
#> 2  2  3  7
```

``` r
b <- data.frame(cbind(c(1,2), c(5, "kk"), c(5,7)))
class(b)
#> [1] "data.frame"
filter.na(b, direction = "col")
#> $ContainNA
#> [1] FALSE
#> 
#> $FilteredData
#>   X1 X2 X3
#> 1  1  5  5
#> 2  2 kk  7
```

``` r
c <- cbind(c(1,2), c(NA, 7), c(5,7))
class(c)
#> [1] "matrix"
filter.na(c, direction = "col")
#> Error in filter.na(c, direction = "col"): Please input a data frame!
```
