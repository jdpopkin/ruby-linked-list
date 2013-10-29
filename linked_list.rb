class LinkedList
  # a class representing one element within the linked list.
  class Node
    attr_accessor :val, :next_node

    def initialize(val)
      self.val = val
    end
  end

  attr_accessor :first_node, :last_node

  def initialize(val)
    self.first_node = Node.new(val)
    self.last_node = self.first_node
  end

  # add val to the end of the list.
  def add_val(val)
    node = Node.new(val)
    self.last_node.next_node = node
    self.last_node = node
  end

  # remove the first node containing val from the linked list.
  def remove_val(val)
    node = self.first_node

    until node.val == val || node.nil?
      prev_node = node
      node = node.next_node
    end

    if node && prev_node
      prev_node.next_node = node.next_node

    elsif node
      self.first_node = node.next_node
    end

  end

  # given a block, executes the block once for each item in the linked list,
  # using the item as the argument for the block.
  def each(&block)
    curr_node = self.first_node

    while curr_node
      block.call(curr_node.val)
      curr_node = curr_node.next_node
    end
  end
end

# a main method for testing the LinkedList class
def main
  list = LinkedList.new(1)
  list.add_val(2)
  list.add_val(3)
  list.add_val(4)
  list.add_val(5)
  list.add_val(6)

  list.each { |val| puts val }

  list.remove_val(1)
  list.remove_val(3)
  list.remove_val(5)

  list.each { |val| puts val }

  list.add_val(-1)

  list.each { |val| puts val }
end