require("should");
var sll = require("../");
var assert = require("assert");
var SinglyLinkedList = sll.SinglyLinkedList;

describe("SinglyLinkedList", function() {
  describe("#append()", function() {
    it("should append to an empty list", function() {
      var l = new SinglyLinkedList();
      l.append(0);
      l.head.data.should.equal(0);
      assert(!l.head.next_node);
      l.head.should.equal(l.tail);
      l.toString().should.equal("[0]");
      l.append(null);
      l.toString().should.equal("[0 -> null]");
      l.append("a");
      l.toString().should.equal("[0 -> null -> \"a\"]");
    });
  });

  describe("#toString()", function() {
    it("should make a string", function() {
      var l = new SinglyLinkedList([0, null, "a"]);
      l.toString().should.equal("[0 -> null -> \"a\"]");
      var l = new SinglyLinkedList([]);
      l.toString().should.equal("[]");
      var l = new SinglyLinkedList(["I am a funny bunch of coconuts"]);
      l.toString().should.equal("[\"I am a funny bunch of coconuts\"]");
      var l = new SinglyLinkedList([[1, "list"]]);
      l.toString().should.equal("[[1,\"list\"]]");
    });
  });

  describe("#SinglyLinkedList", function() {
    it("takes an array as a constructor parameter", function() {
      var l = new SinglyLinkedList([0, null, "a"]);
      l.toString().should.equal("[0 -> null -> \"a\"]");
    });
  });

  describe("#append_node", function() {
    it("appends a node", function() {
      var l1 = new SinglyLinkedList([1,2]);
      var l2 = new SinglyLinkedList([3,4]);
      l1.append_node(l2.head);
      l1.toString().should.equal("[1 -> 2 -> 3 -> 4]");
    });
  });

  describe("#insert", function() {
    it("inserts at 0 on an empty list", function() {
      var l = new SinglyLinkedList();
      l.insert(0, 'begin');
      l.toString().should.equal("[\"begin\"]");
    });
    it("inserts at 0 a list with 1 item", function() {
      var l = new SinglyLinkedList([1]);
      l.insert(0, 'begin');
      l.toString().should.equal("[\"begin\" -> 1]");
    });
    it("inserts at 0 a list with 2 items", function() {
      var l = new SinglyLinkedList([1, 2]);
      l.insert(0, 'begin');
      l.toString().should.equal("[\"begin\" -> 1 -> 2]");
    });
    it("inserts at end of a list with 1 item", function() {
      var l = new SinglyLinkedList(['begin']);
      l.insert(1, "second");
      l.toString().should.equal("[\"begin\" -> \"second\"]");
    });
    it("inserts at end of a list with 2 items", function() {
      var l = new SinglyLinkedList([1, 2]);
      l.insert(2, "end");
      l.toString().should.equal("[1 -> 2 -> \"end\"]");
    });
    it("inserts in the middle of a list with 2 items", function() {
      var l = new SinglyLinkedList([1, 2]);
      l.insert(1, "middle");
      l.toString().should.equal("[1 -> \"middle\" -> 2]");
    });
  });

  describe("#delete", function() {
    it("returns itself when called on an empty list", function() {
      l = new SinglyLinkedList();
      var res = l.delete(999);
      l.toString().should.equal("[]");
      res.should.equal(l);
    });
    it("deletes the first item from a list of 2 items", function() {
      l = new SinglyLinkedList([10, 20]);
      l.delete(10);
      l.toString().should.equal("[20]");
    });
    it("makes no changes if data is not in the list", function() {
      l = new SinglyLinkedList([10, 20]);
      l.delete(99);
      l.toString().should.equal("[10 -> 20]");
    });
    it("deletes the first item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.delete(1);
      l.toString().should.equal("[2 -> 3]");
    });
    it("deletes the middle item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.delete(2);
      l.toString().should.equal("[1 -> 3]");
    });
    it("deletes the last item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.delete(3);
      l.toString().should.equal("[1 -> 2]");
    });
  });

  describe("#length", function() {
    it("returns 0 on an empty list", function() {
      new SinglyLinkedList().length.should.equal(0);
    });
    it("returns 1 on a size 1 list", function() {
      new SinglyLinkedList([1]).length.should.equal(1);
    });
    it("returns 3 on a size 3 list", function() {
      new SinglyLinkedList([1, 2, 3]).length.should.equal(3);
    });
  });

  describe("#getItem", function() {
    it("returns the first item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.getItem(0).should.equal(1);
    });
    it("returns the middle item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.getItem(1).should.equal(2);
    });
    it("returns the last item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.getItem(2).should.equal(3);
    });
    it("returns undefined", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      assert(l.getItem(3) === undefined);
    });
    it("returns the first item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.getItem(-3).should.equal(1);
    });
    it("returns the middle item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.getItem(-2).should.equal(2);
    });
    it("returns the last item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      l.getItem(-1).should.equal(3);
    });
    it("returns undefined", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      assert(l.getItem(-10) === undefined);
    });
  });

  describe("#forEach", function() {
    it("calls the callback for every item", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      var values = [];
      l.forEach(function(value, index, list) {
        values[index] = value;
        list.should.equal(l);
      });
      values.should.eql([1, 2, 3]);
    });

    it("calls the callback with thisArg", function() {
      l = new SinglyLinkedList([1, 2, 3]);
      var thisArg = new Object();
      l.forEach(function(value, index, list) {
        this.should.equal(thisArg);
      }, thisArg);
    });
  });
});
