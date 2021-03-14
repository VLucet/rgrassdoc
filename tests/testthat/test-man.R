
test_that("viewer option works as expected",{
  the_module <- "r.in.gdal"
  if (!interactive()){
    expect_message(man(the_module),
                   "Session is not interactive - viewer cannot be used")
    expect_message(man("r.in.gdal"),
                   "Session is not interactive - viewer cannot be used")
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
