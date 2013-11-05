
function max(x, y) {
  if (x > y) {
    return x;
  }
  return y;
}

function maximumWeightedSubset(weights, bound) {
  var maxWeights = [];

  for (var i = 0; i < weights[0]; i++) {
    maxWeights[i] = 0;
  }
  for (var i = weights[0]; i <= bound; i++) {
    maxWeights[i] = weights[0];
  }

  for (var i = 1; i < weights.length; i++) {
    for (var j = bound; j >= 0; j--) {
      if (j >= weights[i]) {
        maxWeights[j] = max(maxWeights[j], maxWeights[j - weights[i]] + weights[i]);
      }
    }
  }

  return maxWeights[bound];
}

require("should")
describe("maximumWeightedSubset", function() {
  it("passes", function() {
    maximumWeightedSubset([1, 3, 6], 9).should.equal(9);
    maximumWeightedSubset([1, 3, 6], 8).should.equal(7);
    maximumWeightedSubset([1, 2, 3], 7).should.equal(6);
    maximumWeightedSubset([1, 2, 3], 6).should.equal(6);
    maximumWeightedSubset([1, 2, 3], 5).should.equal(5);
    maximumWeightedSubset([1, 2, 3], 4).should.equal(4);
    maximumWeightedSubset([1, 2, 3], 3).should.equal(3);
    maximumWeightedSubset([1, 2, 3], 2).should.equal(2);
    maximumWeightedSubset([1, 2, 3], 1).should.equal(1);
    maximumWeightedSubset([4, 2, 1], 7).should.equal(7);
    maximumWeightedSubset([4, 2, 1], 6).should.equal(6);
    maximumWeightedSubset([4, 2, 1], 5).should.equal(5);
    maximumWeightedSubset([4, 2, 1], 4).should.equal(4);
    maximumWeightedSubset([4, 2, 1], 3).should.equal(3);
    maximumWeightedSubset([4, 2, 1], 2).should.equal(2);
    maximumWeightedSubset([4, 2, 1], 1).should.equal(1);
    maximumWeightedSubset([3, 5, 7], 6).should.equal(5);
  });
});
