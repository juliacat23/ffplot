library(testthat)
library(fflr)
library(ffplot)

test_that("point chart with projected standings", {
  d <- league_standings(252353)
  p <- standings_change(d)
  expect_s3_class(p, "ggplot")
  expect_s3_class(p$layers[[1]]$geom, "GeomPoint")
})

test_that("point change with standings saved to disk", {
  d <- league_standings(252353)
  tmp <- tempfile(fileext = ".png")
  p <- standings_change(d, filename = tmp)
  expect_s3_class(p, "ggplot")
  expect_s3_class(p$layers[[1]]$geom, "GeomPoint")
  expect_true(file.exists(tmp))
})
