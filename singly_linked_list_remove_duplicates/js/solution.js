#!/usr/bin/env node

var s = require("./SinglyLinkedList");

var sets = require("simplesets");

function removeDuplicates(sll) {
  var seen_data = new sets.Set();
  var node = sll.head;
  var prev = null;
  while (node) {
    if (seen_data.has(node.data)) {
      prev.next_node = node.next_node;
      if (sll.tail == node) {
        sll.tail = prev;
      }
    } else {
      seen_data.add(node.data);
      prev = node;
    }
    node = node.next_node;
  }
  return sll;
}

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
