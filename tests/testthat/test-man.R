
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
                   "Displaying module")
    expect_message(man("r.in.gdal", viewer = "browser"),
                   "Displaying module")
    expect_message(man(r.out.gdal, viewer = "browser"),
                   "Displaying module")
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
                   "Displaying module")
    expect_message(man("g.cloud", viewer = "browser"),
                   "Displaying module")
    expect_message(man(g.cloud, viewer = "browser"),
                   "Displaying module")
  }
}
)
