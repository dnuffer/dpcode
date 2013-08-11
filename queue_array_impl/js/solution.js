#!/usr/bin/env node

function Queue() {
  this.length = 0;
  this.begin = 0;
  this.data = new Array(1);
}

Queue.prototype.empty = function() {
  return this.length == 0;
};

Queue.prototype.pushBack = function(item) {
  if (this.data.length < this.length + 1) {
    var new_data;// = new Array((this.length + 1) * 3 / 2);
    if (this.begin == 0) {
      new_data = this.data.concat(new Array(~~((this.length + 1) / 2)));
    } else {
      // 2 parts, wrapped
      var p1begin = this.begin;
      var p1len = this.data.length - p1begin;
      var p2begin = 0;
      var p2len = this.length - p1len;
      new_data = this.data.slice(p1begin, p1begin + p1len).
        concat(this.data.slice(p2begin, p2begin + p2len)).
        concat(new Array(~~((this.length + 2) / 2)));
      this.begin = 0;
    }
    this.data = new_data;
  }

  this.data[(this.begin + this.length) % this.data.length] = item;
  this.length++;
};

Queue.prototype.popFront = function() {
  var result = this.data[this.begin];
  this.length--;
  this.begin = (this.begin + 1) % this.data.length;
  return result;
};


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
