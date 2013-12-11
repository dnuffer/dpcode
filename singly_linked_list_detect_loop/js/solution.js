#!/usr/bin/env node

var s = require("../../js/singly_linked_list_complete/lib/singly_linked_list");
sll = s.SinglyLinkedList;
require("should");
var assert = require("assert");

function detectLoop(l) {
  var slow = l.head;
  var fast = l.head;
  while (fast && fast.nextNode) {
    slow = slow.nextNode;
    fast = fast.nextNode.nextNode;
    if (slow == fast) {
      break;
    }
  }

  if (fast == null || fast.nextNode == null) {
    return undefined;
  }

  var fromCollision = fast;
  var fromHead = l.head;

  while (fromCollision != fromHead) {
    fromCollision = fromCollision.nextNode;
    fromHead = fromHead.nextNode;
  }

  return fromCollision;
}

describe("detect_loop", function() {
  it("returns undefined for empty", function() {
    assert(detectLoop(new sll()) === undefined);
  });
  it("returns undefined for no loop", function() {
    assert(detectLoop(new sll([1])) === undefined);
  });
  it("returns undefined for no loop 2", function() {
    assert(detectLoop(new sll([1, 2])) === undefined);
  });
  it("finds a one node loop", function() {
    l = new sll([1]);
    l.head.nextNode = l.head;
    detectLoop(l).should.eql(l.head);
  });
  it("finds a two node loop", function() {
    l = new sll([1, 2]);
    l.head.nextNode.nextNode = l.head;
    detectLoop(l).should.eql(l.head);
  });
  it("finds a loop at end", function() {
    l = new sll([1, 2]);
    l.head.nextNode.nextNode = l.head.nextNode;
    detectLoop(l).should.eql(l.head.nextNode);
  });
  it("finds a loop at end of 3, size 2", function() {
    l = new sll([1, 2, 3]);
    l.head.nextNode.nextNode.nextNode = l.head.nextNode;
    detectLoop(l).should.eql(l.head.nextNode);
  });
});
