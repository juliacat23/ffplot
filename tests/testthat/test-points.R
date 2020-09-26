library(testthat)
library(fflr)
library(ffplot)

test_that("bar chart from league standings", {
  d <- league_standings(252353)
  p <- points_total(d)
  expect_s3_class(p, "ggplot")
  expect_s3_class(p$layers[[1]]$geom, "GeomCol")
})
