library(devtools)
install('../../R/singlyLinkedList')
library('singlyLinkedList')

singlyLinkedList = singlyLinkedList:::singlyLinkedList

detectLoop = function(sll) {
  if (is.null(sll$head) || is.null(sll$head$nextNode))
    return(NULL);

  fast = sll$head
  slow = sll$head

  while (!is.null(fast) && !is.null(fast$nextNode)) {
    fast = fast$nextNode$nextNode
    slow = slow$nextNode
    if (identical(fast, slow))
      break
  }

  if (is.null(fast) || is.null(fast$nextNode))
    return(NULL)

  fromHead = sll$head
  fromFast = fast

  while (!identical(fromHead, fromFast)) {
    fromHead = fromHead$nextNode
    fromFast = fromFast$nextNode
  }

  return(fromHead)
}

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
