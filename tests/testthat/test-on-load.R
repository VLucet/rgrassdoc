test_that("on load message works", {
  expect_message({
    unloadNamespace("rgrassdoc")
    library(rgrassdoc)
  }, "GRASS GIS documentation")
})
