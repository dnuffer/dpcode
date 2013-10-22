require("should");
var sll = require("../");
var assert = require("assert");

describe("SinglyLinkedList", function() {
  describe("#append()", function() {
    it("should append to an empty list", function() {
      var l = new sll.SinglyLinkedList();
      l.append(0);
      l.head.data.should.equal(0);
      assert(!l.head.next_node);
      l.head.should.equal(l.tail);
    });
  });
});
