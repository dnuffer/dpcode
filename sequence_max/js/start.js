#!/usr/bin/env node

_ = require("underscore");


require("should");

describe("sequence_max", function() {
  it("returns the max of an array", function() {
    sequence_max([1,2,3]).should.eql(3);
  });
  it("returns the max 4 of an array", function() {
    sequence_max([1,2,3,4]).should.eql(4);
  });
});
