library(testthat)
library(fflr)
library(ffplot)

test_that("bar chart with weekly scores", {
  d <- weekly_matchups(252353)
  p <- weekly_scores(d)
  expect_s3_class(p, "ggplot")
  expect_s3_class(p$layers[[1]]$geom, "GeomCol")
})

test_that("bar chart with power wins", {
  d <- weekly_matchups(252353)
  p <- weekly_power(d)
  expect_s3_class(p, "ggplot")
  expect_s3_class(p$layers[[1]]$geom, "GeomCol")
})
