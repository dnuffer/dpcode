binary_search = function(l, x) {
  low = 1
  high = length(l) + 1
  while (low < high)
  {
    mid = floor((low + high) / 2)
    if (l[mid] == x && (mid == 1 || l[mid-1] != x))
    {
      return(mid)
    }
    else if (l[mid] < x)
    {
      low = mid + 1
    }
    else
    {
      high = mid
    }
  }
  return(-1)
}

library(testthat)

context("binary_search")

test_that("finds_one_element", {
  expect_that(binary_search(c(0), 0), equals(1))
})

test_that("doesnt_find_in_empty", {
          expect_that(binary_search(c(), 0), equals(-1))
})

test_that("doesnt_find_one_greater_than", {
          expect_that(binary_search(c(0), 1), equals(-1))
})

test_that("doesnt_find_one_less_than", {
          expect_that(binary_search(c(1), 0), equals(-1))
})

test_that("finds_first_element_of_two", {
          expect_that(binary_search(c(1,2), 1), equals(1))
})

test_that("finds_second_element_of_two", {
          expect_that(binary_search(c(1,2), 2), equals(2))
})

test_that("finds_first_element_of_three", {
          expect_that(binary_search(c(1,2,3), 1), equals(1))
})

test_that("finds_second_element_of_three", {
          expect_that(binary_search(c(1,2,3), 2), equals(2))
})

test_that("finds_third_element_of_three", {
          expect_that(binary_search(c(10,20,30), 30), equals(3))
})

test_that("returns first of repeated", {
          expect_that(binary_search(c(1,1), 1), equals(1))
})

test_that("more repeated", {
          expect_that(binary_search(c(3, 4, 5, 5, 5, 5, 6), 5), equals(3))
})
