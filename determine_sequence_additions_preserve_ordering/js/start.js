_ = require("underscore");



require("should");

describe("determine_additions", function() {
  it("should work", function() {
    determine_additions([1,2,3], [2,3,4]).should.eql([4]);
    determine_additions([1,2,3], [3,4,5]).should.eql([4,5]);
    determine_additions([1,2,3], []).should.eql([]);
    determine_additions([], [1,2,3]).should.eql([1,2,3]);
    determine_additions([], [3,2,1]).should.eql([3,2,1]);
  });
});
