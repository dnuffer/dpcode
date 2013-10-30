#!/usr/bin/env node

var s = require("../../js/singly_linked_list_complete/lib/singly_linked_list");
sll = s.SinglyLinkedList;
require("should");

function prependZeros(l, num_zeros) {
  var result = new sll();
  for (var i = 0; i < num_zeros; i++) {
    result.append(0);
  }
  result.appendNode(l.head);
  return result;
}

function addLists(l1, l2) {
  l1len = l1.length;
  l2len = l2.length;
  maxlen = l1len > l2len ? l1len : l2len;
  l1 = prependZeros(l1, maxlen - l1len);
  l2 = prependZeros(l2, maxlen - l2len);
  var sub = addListNodes(l1.head, l2.head);
  var result = new sll();
  if (sub.carry > 0) {
    result.append(sub.carry);
  }
  result.appendNode(sub.node);
  return result;
}

function addListNodes(node1, node2) {
  if (!node1 || !node2) {
    return { carry: 0, node: null };
  }
  var sub = addListNodes(node1.nextNode, node2.nextNode);
  return { 
    carry: ~~((node1.data + node2.data + sub.carry) / 10),
    node: new s.SinglyLinkedListNode(~~((node1.data + node2.data + sub.carry) % 10), sub.node)
  };
}

describe("add_lists", function() {
  it("1 + 2 = 3", function() {
    addLists(new sll([1]), new sll([2])).should.eql(new sll([3]));
  });
  it("12 + 34 = 46", function() {
    addLists(new sll([1, 2]), new sll([3, 4])).should.eql(new sll([4, 6]));
  });
  it("617 + 295 = 912", function() {
    addLists(new sll([6, 1, 7]), new sll([2, 9, 5])).should.eql(new sll([9, 1, 2]));
  });
  it("4617 + 295 = 4912", function() {
    addLists(new sll([4, 6, 1, 7]), new sll([2, 9, 5])).should.eql(new sll([4, 9, 1, 2]));
  });
  it("617 + 4295 = 4912", function() {
    addLists(new sll([6, 1, 7]), new sll([4, 2, 9, 5])).should.eql(new sll([4, 9, 1, 2]));
  });
  it("617 + 695 = 1312", function() {
    addLists(new sll([6, 1, 7]), new sll([6, 9, 5])).should.eql(new sll([1, 3, 1, 2]));
  });
});
