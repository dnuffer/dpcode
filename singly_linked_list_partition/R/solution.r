library(devtools)
install('../../R/singlyLinkedList')
library('singlyLinkedList')

singlyLinkedList = singlyLinkedList:::singlyLinkedList

partition = function(l, x) {
  front = singlyLinkedList()
  back = singlyLinkedList()
  node = l$head
  while (!is.null(node)) {
    next_node = node$nextNode
    node$nextNode = NULL
    if (node$data < x) {
      front$appendNode(node)
    } else {
      back$appendNode(node)
    }
    node = next_node
  }
  front$appendNode(back$head)
  l$head = front$head
  return(l)
}

library(testthat)

context("partition")


test_that("empty", {
          l = singlyLinkedList()
          expect_that(partition(l, 0)$toString(), equals("[]"))
})

test_that("3,2", {
          l = singlyLinkedList(list(3, 2, 1))
          expect_that(partition(l, 2)$toString(), equals("[1 -> 3 -> 2]"))
})

test_that("3,0", {
          l = singlyLinkedList(list(3, 2, 1))
          expect_that(partition(l, 0)$toString(), equals("[3 -> 2 -> 1]"))
})

test_that("3,1", {
          l = singlyLinkedList(list(3, 2, 1))
          expect_that(partition(l, 1)$toString(), equals("[3 -> 2 -> 1]"))
})

test_that("3,3", {
          l = singlyLinkedList(list(3, 2, 1))
          expect_that(partition(l, 3)$toString(), equals("[2 -> 1 -> 3]"))
})

test_that("3,4", {
          l = singlyLinkedList(list(3, 2, 1))
          expect_that(partition(l, 4)$toString(), equals("[3 -> 2 -> 1]"))
})
