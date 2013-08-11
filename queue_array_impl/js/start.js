#!/usr/bin/env node


require("should");

describe("Queue", function() {
  describe("#empty()", function() {
    it("should return true when no elements have been added", function() {
      var queue = new Queue();
      queue.empty().should.be.true;
    });

    it("should return false when an element has been pushBack()ed", function() {
      var queue = new Queue();
      queue.pushBack(1);
      queue.empty().should.be.false;
    });

    it("should return true when an element has been pushBack()ed and popFront()ed", function() {
      var queue = new Queue();
      queue.pushBack(1);
      queue.popFront();
      queue.empty().should.be.true;
    });
  });

  describe("#popFront()", function() {
    it("should return the items in the order they were passed to pushBack()", function() {
      var queue = new Queue();
      queue.pushBack(1);
      queue.pushBack(2);
      queue.pushBack(3);
      queue.popFront().should.equal(1);
      queue.popFront().should.equal(2);
      queue.popFront().should.equal(3);
      queue.empty().should.be.true;
      queue.pushBack(4);
      queue.empty().should.be.false;
      queue.popFront().should.equal(4);
      queue.empty().should.be.true;

      var inval = 0;
      var out = 0;
      for (var i = 1; i < 100; i++) {
        for (var j = 0; j < i; j++) {
          queue.pushBack(inval);
          inval++;
        }
        queue.popFront().should.equal(out);
        out++;
      }

      while (!queue.empty()) {
        queue.popFront().should.equal(out);
        out++;
      }

    });
  });
});
