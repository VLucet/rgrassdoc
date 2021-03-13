
test_that("version is correct by default", {
  expect_equal(7.8, .Options$grass.version)
  expect_equal(man_get_version(), .Options$grass.version)
})

test_that("version can be changed", {
  expect_equal(man_set_version(7.9), 7.9)
  expect_equal({
    man_set_version(7.9)
    man_get_version()
  }, 7.9)
  man_set_version(7.8)
})
