
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fiftyshadesofgrey

<!-- badges: start -->
<!-- badges: end -->

There is nothing wrong with some old fashion. This package, offers
different black and white palettes to add to all your graphs and plots,
to give some of that old fashion vibe back into a modern era.

## Installation

You can install the development version of fiftyshadesofgrey like so:

``` r
devtools::install_github("arthur1timmermans/fiftyshadesofgrey")
library(fiftyshadesofgrey)
```

## Example

here is an example of how a black and white graph can look:

``` r
library(fiftyshadesofgrey)
library(tidyverse)
#> -- Attaching packages --------------------------------------- tidyverse 1.3.1 --
#> v ggplot2 3.3.6     v purrr   0.3.4
#> v tibble  3.1.7     v dplyr   1.0.9
#> v tidyr   1.2.0     v stringr 1.4.0
#> v readr   2.1.2     v forcats 0.5.1
#> -- Conflicts ------------------------------------------ tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()

ggplot(mtcars, aes(hp, mpg)) +
geom_point(aes(color = factor(carb)), size = 4) +
color_pallete_blackwhite()
```

<img src="man/figures/README-example-1.png" width="100%" />
