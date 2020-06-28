class Node
  attr_accessor :value, :next_node
  def initialize(next_node = nil, value = nil)
    @next_node = next_node
    @value = value
  end
end