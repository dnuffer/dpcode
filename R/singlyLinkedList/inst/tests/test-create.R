context("new singlyLinkedList")

test_that("can new(\"singlyLinkedList\")", {
  expect_that(new("singlyLinkedList"), is_a("singlyLinkedList"))
  expect_that(singlyLinkedList(), is_a("singlyLinkedList"))
})

test_that("can pass a list to the constructor", {
  l = new("singlyLinkedList", list(1, 2, 3))
  expect_that(l, is_a("singlyLinkedList"))
  # TODO: expect_that(l$toString(), equals("[1 -> 2 -> 3]"))
  expect_that(as.list(l$iter()), equals(list(1, 2, 3)))
  expect_that(as.list(iter(l)), equals(list(1, 2, 3)))
  expect_that(as.list(l), equals(list(1, 2, 3)))
  expect_that(singlyLinkedList(list(1,2,3)), is_a("singlyLinkedList"))
  expect_that(singlyLinkedList(c(1,2,3)), is_a("singlyLinkedList"))
})

test_that("append", {
  l = singlyLinkedList()
  l$append(0)
  expect_that(l$head$data, equals(0))
  expect_that(l$head$nextNode, equals(NULL))
  expect_that(l$head, equals(l$tail))
  expect_that(as.list(l), equals(list(0)))
  l$append(NULL)
  expect_that(as.list(l), equals(list(0, NULL)))
  l$append("a")
  expect_that(as.list(l), equals(list(0, NULL, "a")))
})

test_that("toString", {
  expect_that(singlyLinkedList(list(0, NULL, "a"))$toString(), equals("[0 -> NULL -> a]"))
  expect_that(singlyLinkedList()$toString(), equals("[]"))
  expect_that(singlyLinkedList(list("I am a funny bunch of coconuts"))$toString(), equals("[I am a funny bunch of coconuts]"))
  expect_that(singlyLinkedList(list(1, "abc"))$toString(), equals("[1 -> abc]"))
})
