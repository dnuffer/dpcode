require 'rspec'

if __FILE__ == $0
  system "rspec #{__FILE__}"
end

def subset_sum(weights, bound)
  max_weights = Array.new(bound + 1, 0)
  (weights[0]..bound).each { |i|
    max_weights[i] = weights[0]
  }

  (1...weights.size).each { |i|
    (bound).downto(0) { |w|
      if weights[i] <= w
        max_weights[w] = [weights[i] + max_weights[w - weights[i]], max_weights[w]].max
      end
    }
  }

  max_weights[bound]
end

describe "subset_sum" do
  it "works" do
    subset_sum([1, 3, 6], 9).should == 9
    subset_sum([1, 3, 6], 8).should == 7
    subset_sum([1, 2, 3], 7).should == 6
    subset_sum([1, 2, 3], 6).should == 6
    subset_sum([1, 2, 3], 5).should == 5
    subset_sum([1, 2, 3], 4).should == 4
    subset_sum([1, 2, 3], 3).should == 3
    subset_sum([1, 2, 3], 2).should == 2
    subset_sum([1, 2, 3], 1).should == 1
    subset_sum([4, 2, 1], 7).should == 7
    subset_sum([4, 2, 1], 6).should == 6
    subset_sum([4, 2, 1], 5).should == 5
    subset_sum([4, 2, 1], 4).should == 4
    subset_sum([4, 2, 1], 3).should == 3
    subset_sum([4, 2, 1], 2).should == 2
    subset_sum([4, 2, 1], 1).should == 1
    subset_sum([3, 5, 7], 6).should == 5
  end
end
