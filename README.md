
<!-- README.md is generated from README.Rmd. Please edit that file -->

# ffplot

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/ffplot)](https://CRAN.R-project.org/package=ffplot)
[![Codecov test
coverage](https://img.shields.io/codecov/c/github/kiernann/ffplot/master.svg)](https://codecov.io/gh/kiernann/ffplot?branch=master)
![Downloads](https://cranlogs.r-pkg.org/badges/grand-total/ffplot) [![R
build
status](https://github.com/kiernann/ffplot/workflows/R-CMD-check/badge.svg)](https://github.com/kiernann/ffplot/actions)
[![Codecov test
coverage](https://codecov.io/gh/kiernann/ffplot/branch/master/graph/badge.svg)](https://codecov.io/gh/kiernann/ffplot?branch=master)
<!-- badges: end -->

The goal of ffplot is to easily visualize the data scraped from the
[ESPN API](https://fantasy.espn.com/apis/v3/games/ffplot/), via the
[fflr](https://github.com/kiernann/fflr) package, using the
[ggplot2](github.com/tidyverse/ggplot2) tools.

## Installation

You can install the development version of ffplot from
[GitHub](https://github.com/kiernann/ffplot) with:

``` r
# install.packages("remotes")
remotes::install_github("kiernann/ffplot")
```

## Usage

All ffplot functions take take from the fflr package.

``` r
library(fflr)
library(ffplot)
team_points(league_standings(252353))
```

<img src="man/figures/README-team_points-1.png" width="100%" />

<!-- refs: start -->

<!-- refs: end -->
