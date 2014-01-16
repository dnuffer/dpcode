sigmoid = function(z) {
  return(1/(1+exp(-z)))
}

costFunctionReg = function(theta, X, y, lambda) {
  m = nrow(X)

  thetaReg = theta
  thetaReg[1] = 0

  # TODO: Set J
  
  grad = (1 / m) * t(X) %*% (sigmoid(X %*% theta) - y) + (lambda / m * thetaReg)

  return(list(J=J[1,1], grad=grad[,1]))
}

library(testthat)

test_that("test theta zeros, lambda = 0", 
          {
            theta = c(0,0,0)
            X = matrix(c(1.0000, 34.6237, 78.0247,  1.0000, 30.2867, 43.8950,  1.0000, 35.8474, 72.9022,  1.0000,   60.1826,   86.3086), nrow=4, ncol=3, byrow=TRUE)
            y = c(0, 0, 0, 1)
            res = costFunctionReg(theta, X, y, 0);
            print(res)
            expect_that(res$J, equals(0.69315, tol=1e-4))
            expect_that(res$grad, equals(c(0.25000, 5.07190, 13.56416), tol=1e-4))
          }
)

test_that("test theta -0.1, lambda = 0",
          {
            theta = c(-0.1, -0.2, 0.5)
            X = matrix(c(1.0000, 34.6237, 78.0247,  1.0000, 30.2867, 43.8950,  1.0000, 35.8474, 72.9022,  1.0000,   60.1826,   86.3086), nrow=4, ncol=3, byrow=TRUE)
            y = c(0, 0, 0, 1)
            res = costFunctionReg(theta, X, y, 0);
            print(res)
            expect_that(res$J, equals(19.239, tol=1e-3))
            expect_that(res$grad, equals(c(0.75000, 25.18945, 48.70547), tol=1e-4))
          }
)

test_that("test theta -0.1, lambda = 1",
          {
            theta = c(-0.1, -0.2, 0.5)
            X = matrix(c(1.0000, 34.6237, 78.0247,  1.0000, 30.2867, 43.8950,  1.0000, 35.8474, 72.9022,  1.0000,   60.1826,   86.3086), nrow=4, ncol=3, byrow=TRUE)
            y = c(0, 0, 0, 1)
            res = costFunctionReg(theta, X, y, 1);
            print(res)
            expect_that(res$J, equals(19.275, tol=1e-3))
            expect_that(res$grad, equals(c(0.75000, 25.13945, 48.83047), tol=1e-4))
          }
)
