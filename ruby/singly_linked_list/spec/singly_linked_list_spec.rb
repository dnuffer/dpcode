require 'singly_linked_list'
require 'rspec/mocks'

describe SinglyLinkedList do
  subject { SinglyLinkedList.new }
  describe "append" do
    it "should append to an empty list" do
      subject.append(0)
      subject.head.data.should == 0
      subject.head.next_node.should == nil
      # test if same object
      subject.head.should equal(subject.tail)
      subject.to_s.should == "[0]"
      subject.append(nil)
      subject.to_s.should == "[0 -> ]"
      subject.append("a")
      subject.to_s.should == "[0 ->  -> a]"
    end
  end

  describe "to_s" do
    it "should make a string" do
      SinglyLinkedList.new([0, nil, "a"]).to_s.should == "[0 ->  -> a]"
      SinglyLinkedList.new([]).to_s.should == "[]"
      SinglyLinkedList.new(["s"]).to_s.should == "[s]"
      SinglyLinkedList.new([[1, "list"]]).to_s.should == "[[1, \"list\"]]"
    end
  end

  describe "constructor" do
    it "takes an array as a constructor parameter" do
      SinglyLinkedList.new([0, nil, "a"]).to_s.should == "[0 ->  -> a]"
    end
  end

  describe "append_node" do
    it "appends a node" do
      l1 = SinglyLinkedList.new([1, 2])
      l2 = SinglyLinkedList.new([3, 4])
      l1.append_node(l2.head)
      l1.to_s.should == "[1 -> 2 -> 3 -> 4]"
      l1.append(5)
      l1.to_s.should == "[1 -> 2 -> 3 -> 4 -> 5]"
    end
  end

  describe "insert" do
    it "inserts at 0 on an empty list" do
      subject.insert(0, 'begin')
      subject.to_s.should == "[begin]"
    end
    context "a list with 1 item" do
      subject { SinglyLinkedList.new([1]) }
      it "inserts at 0" do
        subject.insert(0, 'begin')
        subject.to_s.should == "[begin -> 1]"
      end
      it "inserts at end" do
        subject.insert(1, 'end')
        subject.to_s.should == "[1 -> end]"
      end
    end
    context "a list with 2 items" do
      subject { SinglyLinkedList.new([1, 2]) }
      it "inserts at beginning" do
        subject.insert(0, 'begin')
        subject.to_s.should == "[begin -> 1 -> 2]"
      end
      it "inserts in middle" do
        subject.insert(1, 'middle')
        subject.to_s.should == "[1 -> middle -> 2]"
      end
      it "inserts at end" do
        subject.insert(2, 'end')
        subject.to_s.should == "[1 -> 2 -> end]"
      end
    end
  end

  describe "delete" do
    it "returns itself when called on an empty list" do
      res = subject.delete(999)
      subject.to_s.should == "[]"
      res.should equal(subject)
    end
    context "two items" do
      subject { SinglyLinkedList.new([10, 20]) }
      it "deletes the first item" do
        subject.delete(10)
        subject.to_s.should == "[20]"
      end
      it "makes no changes if data is not in the list" do
        subject.delete(99)
        subject.to_s.should == "[10 -> 20]"
      end
    end
    context "three items" do
      subject { SinglyLinkedList.new([1, 2, 3]) }
      it "deletes the first item" do
        subject.delete(1)
        subject.to_s.should == "[2 -> 3]"
      end
      it "deletes the second item" do
        subject.delete(2)
        subject.to_s.should == "[1 -> 3]"
      end
      it "deletes the third item" do
        subject.delete(3)
        subject.to_s.should == "[1 -> 2]"
      end
    end
  end

  describe "count" do
    it "returns 0 on an empty list" do
      subject.count.should == 0
    end
    it "returns 1 on an list with 1 item" do
      SinglyLinkedList.new([1]).count.should == 1
    end
    it "returns 3 on an list with 3 items" do
      SinglyLinkedList.new([1, 2, 3]).count.should == 3
    end
  end

  describe "each" do
    subject { SinglyLinkedList.new([1, 2, 3]) }
    it "calls the block for every item" do
      values = []
      subject.each { |x| values << x }
      values.should == [1, 2, 3]
    end
  end

  it "is an Enumerable" do
    subject.should be_an(Enumerable)
  end
end
