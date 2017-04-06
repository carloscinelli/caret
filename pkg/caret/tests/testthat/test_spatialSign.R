context('spatialSign')

test_that("errors working", {

  # vector
  expect_error(spatialSign(iris$Species)
    ,"not defined"
  )

  # matrix
  expect_error(spatialSign(as.matrix(iris))
    ,"not defined"
  )

  # data.frame
  expect_error(spatialSign(iris)
    ,"not defined"
  )

})

test_that("results match", {

  x = -100:100
  all(spatialSign(x) == x/sqrt(sum(x^2)))

  i4 <- spatialSign(iris[,1:4])
  all(as.matrix(i4) == t(apply(iris[,1:4], 1, spatialSign)))

})


test_that("high level tests", {

  i4 <- spatialSign(iris[,1:4])

  expect_true(all(colnames(i4) == names(iris[1:4])))
  expect_true(all(dim(i4) == dim(iris[1:4])))

})