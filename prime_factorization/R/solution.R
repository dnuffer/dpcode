library(testthat)

factor_iterative = function (x){
  res = c()
  i = 2
  while (i <= sqrt(x)) {
    if (x %% i == 0) {
      res = c(res, i)
      x = x %/% i
    } else {
      i = i + 1
    }
  }
  res = c(res, x)
  return(res)
}


factor_recursive = function(x) {
  factor_aux = function(x, i){
    if (i > sqrt(x))
      c(x)
    else if (x %% i == 0)
      c(i, factor_aux(x %/% i, i))
    else
      factor_aux(x, i + 1)
  }
  factor_aux(x, 2)
}

test_that("can factor_iterative a prime", {
  l = factor_iterative(3)
  expect_that(l, equals(c(3)))
})

test_that("can factor_iterative non-primes", {
  l = factor_iterative(10)
  expect_that(l, equals(c(2, 5)))
  l = factor_iterative(32)
  expect_that(l, equals(c(2,2,2,2,2)))
  l = factor_iterative(24)
  expect_that(l, equals(c(2,2,2,3)))
})

test_that("can factor_recursive a prime", {
  l = factor_recursive(3)
  expect_that(l, equals(c(3)))
})

test_that("can factor_recursive non-primes", {
  l = factor_recursive(10)
  expect_that(l, equals(c(2, 5)))
  l = factor_recursive(32)
  expect_that(l, equals(c(2,2,2,2,2)))
  l = factor_recursive(24)
  expect_that(l, equals(c(2,2,2,3)))
})
