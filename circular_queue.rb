require_relative "linked_list.rb"

class CircularQueue < LinkedList
  def initialize(val)
    super
    self.last_node.next_node = self.first_node
  end

  # next_node on the final node should point to the first node (it points
  # to nil in super)
  def add_val(val)
    super
    self.last_node.next_node = self.first_node
  end

  # If the node to be removed was the first node of the list,
  # we need to make sure that the last node still points to the
  # first node.
  def remove_val(val)
    super

    self.last_node.next_node = self.first_node
  end

  def each(&block)
    curr_node = self.first_node
    first_iteration_incomplete = true

    # essentially a do-while.
    loop do
      block.call(curr_node.val)
      curr_node = curr_node.next_node
      break if curr_node == self.first_node
    end
  end

end

def main
  list = CircularQueue.new(1)
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

  puts list.last_node.val
  puts list.first_node.val
  puts list.last_node.next_node.val
end