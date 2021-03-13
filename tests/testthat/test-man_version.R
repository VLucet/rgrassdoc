
test_that("version is correct by default", {
  expect_equal(7.8, .Options$grass.version)
  expect_equal(man_get_version(), .Options$grass.version)
})

test_that("version can be changed", {
  expect_equal(man_set_version(7.9), 7.9)
  expect_message(man_set_version(7.9),
                 "GRASS GIS documentation - set to GRASS version 7.9")
  expect_equal({
    man_set_version(7.9)
    man_get_version()
  }, 7.9)
  man_set_version(7.8)
})

taht_that("error when incorrect version", {
  expect_error(man_set_version(1),
               "version must be of the form: x.x (i.g 7.8)")
})
