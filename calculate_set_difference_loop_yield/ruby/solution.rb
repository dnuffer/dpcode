if __FILE__ == $0
  exit 1 unless system "rspec #{__FILE__}"
end

def set_difference(first, second)
  return Enumerator.new do |y|
    second_set = Hash[ second.map { |x| [x, nil] } ]
    first.each do |item|
      unless second_set.include? item
        y.yield item
      end
    end
  end
end


require 'rspec'

describe "set_difference_loop_yield" do
  it "does it" do
    set_difference([1, 2, 3], [1]).to_a.should == [2, 3]
    set_difference([3, 4, 1], [1]).to_a.should == [3, 4]
    set_difference([1], [1, 2, 3]).to_a.should == []
  end
end
