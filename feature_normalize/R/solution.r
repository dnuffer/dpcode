feature.normalize = function(X) {
  mu = colMeans(X)
  sigma = apply(X, 2, sd)
  X.norm = t(apply(X, 1, function(row) (row - mu) / sigma ))
  return(list(X.norm = X.norm, mu = mu, sigma = sigma))
}

library(testthat)
test_that("feature.normalize works", {
          X = matrix(c(1,3,2,4,3,5), nrow=3, ncol=2, byrow=TRUE)
          expect_that(feature.normalize(X), equals(
                      list(X.norm = matrix(c(-1, -1, 0, 0, 1, 1), nrow=3, ncol=2, byrow=TRUE),
                           mu = c(2, 4),
                           sigma = c(1, 1)
                           )
                      ))
})
