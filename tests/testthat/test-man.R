test_that("man - external object",{
  the_module <- "v.overlay"
  expect_error(man(the_module), "RStudio not running")
}
)

test_that("man - string",{
  expect_error(man("r.in.gdal"), "RStudio not running")
}
)

test_that("man - NSE",{
  expect_error(man(r.out.gdal), "RStudio not running")
}
)

test_that("man - fails if incorrect module",{
  expect_error(man("incorrect.module"),
               "Error: no manual entry exists for module <incorrect.module>")
}
)
