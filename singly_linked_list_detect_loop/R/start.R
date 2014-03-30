library(devtools)
install('../../R/singlyLinkedList')
library('singlyLinkedList')

singlyLinkedList = singlyLinkedList:::singlyLinkedList


library(testthat)

context("detectLoop")


test_that("empty", {
          l = singlyLinkedList()
          expect_that(detectLoop(l), is_null())
})

test_that("one node", {
          l = singlyLinkedList(list(1))
          expect_that(detectLoop(l), is_null())
})

test_that("one node loop", {
          l = singlyLinkedList(list(1))
          l$head$nextNode = l$head
          expect_that(detectLoop(l), is_identical_to(l$head))
})

test_that("two node loop", {
          l = singlyLinkedList(list(1, 2))
          l$head$nextNode$nextNode = l$head
          expect_that(detectLoop(l), is_identical_to(l$head))
})

test_that("one node loop down one", {
          l = singlyLinkedList(list(1, 2))
          l$head$nextNode$nextNode = l$head$nextNode
          expect_that(detectLoop(l), is_identical_to(l$head$nextNode))
})

test_that("two node loop down one", {
          l = singlyLinkedList(list(1, 2, 3))
          l$head$nextNode$nextNode$nextNode = l$head$nextNode
          expect_that(detectLoop(l), is_identical_to(l$head$nextNode))
})
