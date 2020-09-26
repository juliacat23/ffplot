
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ffplot

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ffplot)](https://CRAN.R-project.org/package=ffplot)
![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/ffplot) [![R
build
status](https://github.com/kiernann/ffplot/workflows/R-CMD-check/badge.svg)](https://github.com/kiernann/ffplot/actions)
[![Codecov test
coverage](https://codecov.io/gh/kiernann/ffplot/branch/master/graph/badge.svg)](https://codecov.io/gh/kiernann/ffplot?branch=master)
<!-- badges: end -->

The goal of ffplot is to visualize fantasy football data from ESPN and
[fflr](https://github.com/kiernann/fflr) using
[ggplot2](github.com/tidyverse/ggplot2).

## Installation

You can install the development version of ffplot from
[GitHub](https://github.com/kiernann/ffplot) with:

``` r
# install.packages("remotes")
remotes::install_github("kiernann/ffplot")
```

## Usage

All ffplot functions take data frames from the
[fflr](https://github.com/kiernann/fflr) package.

``` r
library(fflr)
library(ffplot)
x <- league_standings(252353)
standings_change(x)
```

<img src="man/figures/README-team_points-1.png" width="100%" />

<!-- refs: start -->

<!-- refs: end -->
