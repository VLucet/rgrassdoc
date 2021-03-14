
test_that("viewer option works as expected",{
  the_module <- "r.in.gdal"
  if (!interactive()){
    # Object
    expect_message(man(the_module),
                   "Session is not interactive - viewer cannot be used")
    # String
    expect_message(man("r.in.gdal"),
                   "Session is not interactive - viewer cannot be used")
    # NSE
    expect_message(man(r.out.gdal),
                   "Session is not interactive - viewer cannot be used")
  } else {
    expect_message(man(the_module),
                   "Displaying module")
    expect_message(man("r.in.gdal"),
                   "Displaying module")
    expect_message(man(r.out.gdal),
                   "Displaying module")
  }
}
)

test_that("matches options works as expected",{

  # Success
  the_module <- "r.in.g"
  if (!interactive()){
    # Object
    expect_message(man(the_module),
                   "Session is not interactive - viewer cannot be used")
    # String
    expect_message(man("r.in.g"),
                   "Session is not interactive - viewer cannot be used")
    # NSE
    expect_message(man(r.in.g),
                   "Session is not interactive - viewer cannot be used")
  } else {
    expect_message(man(the_module),
                   "Displaying module")
    expect_message(man("r.in.g"),
                   "Displaying module")
    expect_message(man(r.in.g),
                   "Displaying module")
  }

  # Failure
  the_module <- "xxx"
  # Object
  expect_error(man(the_module),
               "module not found")
  # String
  expect_error(man("xxx"),
               "module not found")
  # NSE
  expect_error(man(xxx),
               "module not found")
}
)

test_that("browser option works as expected",{
  the_module <- "r.in.gdal"
  if (!interactive()){
    expect_message(man(the_module, viewer = "browser"),
                   "Session is not interactive - browser cannot be used")
    expect_message(man("r.in.gdal", viewer = "browser"),
                   "Session is not interactive - browser cannot be used")
    expect_message(man(r.out.gdal, viewer = "browser"),
                   "Session is not interactive - browser cannot be used")
  } else {
    expect_message(man(the_module, viewer = "browser"),
                   "Opening module")
    expect_message(man("r.in.gdal", viewer = "browser"),
                   "Opening module")
    expect_message(man(r.out.gdal, viewer = "browser"),
                   "Opening module")
  }
}
)

test_that("viewer option works as expected - addon",{
  the_module <- "g.cloud"
  if (!interactive()){
    expect_message(man(the_module),
                   "Session is not interactive - viewer cannot be used")
    expect_message(man("g.cloud"),
                   "Session is not interactive - viewer cannot be used")
    expect_message(man(g.cloud),
                   "Session is not interactive - viewer cannot be used")
  } else {
    expect_message(man(the_module),
                   "Displaying module")
    expect_message(man("g.cloud"),
                   "Displaying module")
    expect_message(man(g.cloud),
                   "Displaying module")
  }
}
)

test_that("browser option works as expected - addon",{
  the_module <- "g.cloud"
  if (!interactive()){
    expect_message(man(the_module, viewer = "browser"),
                   "Session is not interactive - browser cannot be used")
    expect_message(man("g.cloud", viewer = "browser"),
                   "Session is not interactive - browser cannot be used")
    expect_message(man(g.cloud, viewer = "browser"),
                   "Session is not interactive - browser cannot be used")
  } else {
    expect_message(man(the_module, viewer = "browser"),
                   "Opening module")
    expect_message(man("g.cloud", viewer = "browser"),
                   "Opening module")
    expect_message(man(g.cloud, viewer = "browser"),
                   "Opening module")
  }
}
)

test_that("fail on bad viewer argument", {
  expect_message(man(r.in.gdal,viewer = "wrong_viewer"),
                 "Argument 'viewer' must be one of 'viewer' OR 'browser'")
})
