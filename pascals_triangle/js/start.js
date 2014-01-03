
require("should");

describe("pascal", function() {
  it("should work", function() {
    pascal(0, 2).should.equal(1);
    pascal(1, 2).should.equal(2);
    pascal(1, 3).should.equal(3);
  });
});
