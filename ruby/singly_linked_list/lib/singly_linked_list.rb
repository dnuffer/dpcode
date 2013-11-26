require "singly_linked_list/version"

class SinglyLinkedList

  class Node
    attr_accessor :data, :next_node
    def initialize(data = nil, next_node = nil)
      @data = data
      @next_node = next_node
    end
  end

  attr_accessor :head, :tail

  def initialize(items = nil)
    @head = nil
    @tail = nil
    if items
      items.each {|i| append(i) }
    end
  end

  def append data
    append_node(Node.new(data))
  end

  def append_node node
    if @tail
      @tail.next_node = node
    else
      @head = node
    end

    node_tail = node
    cur = node.next_node
    while cur
      node_tail = cur
      cur = cur.next_node
    end

    @tail = node_tail
    return self
  end

  def to_s
    result = "["
    node = @head
    if node
      result << node.data.to_s
      node = node.next_node
      while node
        result << " -> "
        result << node.data.to_s
        node = node.next_node
      end
    end
    result << "]"
    return result
  end

  def insert(position, data)
    if position == 0 && !@tail
      append(data)
    else
      node = @head
      prev = nil
      while node && position > 0
        prev = node
        node = node.next_node
        position -= 1
      end

      if prev
        prev.next_node = Node.new(data)
        prev.next_node.next_node = node
        if prev == @tail
          @tail = prev.next_node
        end
      else
        old_head = @head
        @head = Node.new(data)
        @head.next_node = old_head
      end
    end
    return self
  end

  def delete(data)
    if !@head
      return self
    end

    if @head.data == data
      if @head == @tail
        @head = @tail = nil
      else
        @head = @head.next_node
      end
    else
      node = @head
      while node.next_node
        if node.next_node.data == data
          if !node.next_node.next_node
            @tail = node
          end
          node.next_node = node.next_node.next_node
        else
          node = node.next_node
        end
      end
    end
  end

  include Enumerable

  def each
    node = @head
    while node
      yield node.data
      node = node.next_node
    end
  end

end
