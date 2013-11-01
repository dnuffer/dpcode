require("should")

function gcd(a, b) {
  if (b == 0) {
    return Math.abs(a);
  }

  while (b != 0) {
    t = b;
    b = a % b;
    a = t;
  }

  return Math.abs(a);
}

describe("gcd", function() {
  it("1,1 = 1", function() {
    gcd(1,1).should.equal(1);
  });
  it("2,2 = 2", function() {
    gcd(2,2).should.equal(2);
  });
  it("4,3 = 1", function() {
    gcd(4,3).should.equal(1);
  });
  it("323,391 = 17", function() {
    gcd(323,391).should.equal(17);
  });
  it("0,0 = 0", function() {
    gcd(0,0).should.equal(0);
  });
  it("0,10 = 10", function() {
    gcd(0,10).should.equal(10);
  });
  it("11,0 = 11", function() {
    gcd(11,0).should.equal(11);
  });
  it("50,-5 = 5", function() {
    gcd(50,-5).should.equal(5);
  });
  it("-50,-5 = 5", function() {
    gcd(-50,-5).should.equal(5);
  });
  it("-50,5 = 5", function() {
    gcd(-50,5).should.equal(5);
  });
});
