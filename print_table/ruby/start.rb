if __FILE__ == $1
  exit 1 unless system "rspec #{__FILE__}"
end



require 'rspec'

describe "print_table" do
  it "formats a table with a single element" do
    print_table([["x"]]).should == "x\n"
  end
  it "formats a table with a single element in two rows" do
    print_table([["1"], ["2"]]).should == "1\n2\n"
  end
  it "formats a table with a two elements in two rows" do
    print_table([["12", "34"], ["5", "6"]]).should == "1234\n5 6 \n"
  end
  it "formats a complex table" do
    print_table([["12", "34", "X"], ["5", "678", "Y"], ["901", "2", "ZA"]]).should == "12 34 X \n5  678Y \n9012  ZA\n"
  end
end


