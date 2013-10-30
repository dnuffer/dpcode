#!/usr/bin/env node

var s = require("../../js/singly_linked_list_complete/lib/singly_linked_list");


require("should");

describe("removeDuplicates", function() {
  it("should return a single item", function() {
    removeDuplicates(new s.SinglyLinkedList([1])).should.eql(new s.SinglyLinkedList([1]))
  });
  it("should remove duplicates", function() {
    removeDuplicates(new s.SinglyLinkedList([1, 1])).should.eql(new s.SinglyLinkedList([1]))
    removeDuplicates(new s.SinglyLinkedList([1, 1, 1])).should.eql(new s.SinglyLinkedList([1]))
    removeDuplicates(new s.SinglyLinkedList([1, 1, 2])).should.eql(new s.SinglyLinkedList([1, 2]))
    removeDuplicates(new s.SinglyLinkedList([1, 2, 1])).should.eql(new s.SinglyLinkedList([1, 2]))
    removeDuplicates(new s.SinglyLinkedList([2, 1, 1])).should.eql(new s.SinglyLinkedList([2, 1]))
    removeDuplicates(new s.SinglyLinkedList(["A", "b", "A"])).should.eql(new s.SinglyLinkedList(["A", "b"]))
  });
});

