if __FILE__ == $0
  exit 1 unless system "rspec #{__FILE__}"
end

require 'rspec'


describe "queue" do
  it "works" do
    q = Queue.new
    q.empty.should == true

    q.pushBack(1)
    q.pushBack(2)
    q.pushBack(3)
    q.empty.should == false

    q.popFront().should == 1
    q.popFront().should == 2
    q.popFront().should == 3
    q.empty.should == true

    q.pushBack(4)
    q.empty.should == false
    q.popFront().should == 4
    q.empty.should == true

    inv = 0
    out = 0
    (1..100).each do |i|
      (0..i).each do |j|
        q.pushBack(inv)
        inv += 1
      end

      x = q.popFront()
      x.should == out
      out += 1
    end

    while !q.empty()
      x = q.popFront()
      x.should == out
      out += 1
    end
  end
end
