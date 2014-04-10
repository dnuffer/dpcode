if __FILE__ == $0
  exit 1 unless system "rspec #{__FILE__}"
end

require 'rspec'

class Queue
  def initialize()
    @data = []
    @size = 0
    @begin = 0
  end

  def empty
    @size == 0
  end

  def pushBack(item)
    if @size + 1 > @data.length
      if @begin == 0
        @data += [nil] * (2 * (@data.length + 1))
      else
        p1begin = @begin
        p1len = @size - @begin
        p2begin = 0
        p2len = p1begin
        @data = @data[p1begin, p1len] + @data[p2begin, p2len] + [nil] * (@data.length + 1)
      end
      @begin = 0
    end

    index = (@begin + @size) % @data.length
    @data[index] = item
    @size += 1
  end

  def popFront()
    result = @data[@begin]
    @begin = (@begin + 1) % @data.length
    @size -= 1
    result
  end
end

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
