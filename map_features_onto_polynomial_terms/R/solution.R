map.feature = function(X1, X2, n) {
  result = c(1)
  for (i in seq_len(n)) {
    for (j in 0:i) {
      result = c(result, X1 ^ (i - j) * (X2 ^ j))
    }
  }
  return(result)
}

library(testthat)


test_that("map.feature works", {
  expect_that(map.feature(2, 4, 0), equals(c(1)))
  expect_that(map.feature(2, 4, 1), equals(c(1, 2, 4)))
  expect_that(map.feature(2, 4, 2), equals(c(1, 2, 4, 4, 8, 16)))
  expect_that(map.feature(2, 4, 3), equals(c(1, 2, 4, 4, 8, 16, 8, 16, 32, 64)))
})
