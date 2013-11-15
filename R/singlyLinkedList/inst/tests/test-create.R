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
  res = l$append(0)
  expect_that(l$head$data, equals(0))
  expect_that(l$head$nextNode, equals(NULL))
  expect_that(l$head, equals(l$tail))
  expect_that(as.list(l), equals(list(0)))
  expect_that(l, equals(res))
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

test_that("appendNode", {
  l1 = singlyLinkedList(list(1, 2))
  l2 = singlyLinkedList(list(3, 4))
  res = l1$appendNode(l2$head)
  expect_that(l1$toString(), equals("[1 -> 2 -> 3 -> 4]"))
  expect_that(res, equals(l1))
  l1$append(5)
  expect_that(l1$toString(), equals("[1 -> 2 -> 3 -> 4 -> 5]"))
})

test_that("insert inserts at 0 on an empty list", {
  l = singlyLinkedList()
  res = l$insert(0, "begin")
  expect_that(l$toString(), equals("[begin]"))
  expect_that(res, equals(l))
})

test_that("insert inserts at 0 a list with 1 item", {
  l = singlyLinkedList(list(1))
  l$insert(0, "begin")
  expect_that(l$toString(), equals("[begin -> 1]"))
})

test_that("insert inserts at 0 a list with 2 items", {
  l = singlyLinkedList(list(1, 2))
  l$insert(0, "begin")
  expect_that(l$toString(), equals("[begin -> 1 -> 2]"))
})

test_that("insert inserts at end of list with 1 item", {
  l = singlyLinkedList(list("begin"))
  l$insert(1, "second")
  expect_that(l$toString(), equals("[begin -> second]"))
})

test_that("insert inserts at end of list with 2 items", {
  l = singlyLinkedList(list(1, 2))
  l$insert(2, "end")
  expect_that(l$toString(), equals("[1 -> 2 -> end]"))
})

test_that("insert inserts in the middle of a list with 2 items", {
  l = singlyLinkedList(list(1, 2))
  l$insert(1, "middle")
  expect_that(l$toString(), equals("[1 -> middle -> 2]"))
})

test_that("delete returns itself when called on an empty list", {
  l = singlyLinkedList()
  res = l$delete(999)
  expect_that(l$toString(), equals("[]"))
  expect_that(res, equals(l))
})

test_that("delete deletes the first item from a list of 2 items", {
  l = singlyLinkedList(list(10, 20))
  res = l$delete(10)
  expect_that(l$toString(), equals("[20]"))
  expect_that(res, equals(l))
})

test_that("delete makes no changes if data is not in the list", {
  l = singlyLinkedList(list(10, 20))
  res = l$delete(99)
  expect_that(l$toString(), equals("[10 -> 20]"))
  expect_that(res, equals(l))
})

test_that("delete deletes the first item", {
  l = singlyLinkedList(list(1, 2, 3))
  res = l$delete(1)
  expect_that(l$toString(), equals("[2 -> 3]"))
  expect_that(res, equals(l))
})

test_that("delete deletes the middle item", {
  l = singlyLinkedList(list(1, 2, 3))
  res = l$delete(2)
  expect_that(l$toString(), equals("[1 -> 3]"))
  expect_that(res, equals(l))
})

test_that("delete deletes the last item", {
  l = singlyLinkedList(list(1, 2, 3))
  res = l$delete(3)
  expect_that(l$toString(), equals("[1 -> 2]"))
  expect_that(res, equals(l))
})

test_that("length returns 0 on an empty list", {
  expect_that(length(singlyLinkedList()), equals(0))
})

test_that("length returns 1 on a list with 1", {
  expect_that(length(singlyLinkedList(list(1))), equals(1))
})

test_that("length returns 2 on a list with 2", {
  expect_that(length(singlyLinkedList(list(1, 2))), equals(2))
})

test_that("length returns 3 on a list with 3", {
  expect_that(length(singlyLinkedList(list(1, 2, 3))), equals(3))
})

test_that("index 1 returns the first item", {
  expect_that(singlyLinkedList(list(1, 2, 3))[1], equals(1))
})

test_that("index 2 returns the middle item", {
  expect_that(singlyLinkedList(list(1, 2, 3))[2], equals(2))
})

test_that("invalid index 0 causes a stop()", {
  expect_that(singlyLinkedList(list(1))[0], throws_error())
})

test_that("invalid index too large causes a stop()", {
  expect_that(singlyLinkedList(list(1))[2], throws_error())
})
