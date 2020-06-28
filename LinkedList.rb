require_relative 'Node'
require 'pry'

class LinkedList

  attr_accessor :head, :size
  def initialize
    @head = Node.new
    @size = 1
  end

  def traverse_node(node)
    if node.next_node == nil
      return node
    else
      return traverse_node(node.next_node)
    end
  end
  
  def append(value)
    if @head.value == nil
      @head.value = value
    else
      old_last_node = traverse_node(@head)
      new_node = Node.new
      new_node.value = value
      old_last_node.next_node = new_node
      @size += 1
    end
  end 

  def prepend(value)
    if @head.value == nil
      @head.value = value
    else
      new_node = Node.new
      new_node.value = value
      new_node.next_node = @head
      @head = new_node
      @size += 1
    end
  end 

  def tail
    pointer = @head
    while pointer.next_node != nil
      pointer = pointer.next_node
    end
    return pointer
  end

  def pop
    new_tail = at(@size - 2)
    new_tail.next_node = nil
    @tail = @new_tail
    @size -= 1
  end 

  def at(index)
    pointer = @head
    index.times do
      pointer = pointer.next_node
    end
    return pointer
  end

  def contains?(value)
    pointer = @head
    @size.times do
      if pointer.value == value
        return true
      else
        if pointer.next_node != nil
          pointer = pointer.next_node
        end
      end
    end
    return false
  end

  def find(value)
    pointer = @head
    index = 0
    while pointer != nil
      if pointer.value == value
        return index
      else
        index += 1
        pointer = pointer.next_node
      end
    end
    return nil
  end

  def to_s
    string = ""
    pointer = @head
    @size.times do
      string += "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    string += "nil"
  end

  def insert_at(value, index)
    if index == 0
      prepend(value)
    elsif index > @size
      puts "Please input index not greater than Linked List size" 
    else  
      new_node = Node.new
      new_node.value = value
      pointer = @head
      (index).times do
        pointer = pointer.next_node
      end
      new_node.next_node = pointer
      pointer = @head
      (index - 1).times do
        pointer = pointer.next_node
      end
      pointer.next_node = new_node
      @size += 1
    end
  end

  def remove_at(index)
    if index == 0
      new_head = @head.next_node
      @head = new_head
    elsif index > @size
      puts "Please input index not greater than Linker List size"
    else
      pointer = @head
      (index + 1).times do
        pointer = pointer.next_node
      end
      temp = pointer
      pointer = @head
      (index - 1).times do
        pointer = pointer.next_node
      end
      pointer.next_node = temp
    end
    @size -= 1
  end
end

x = LinkedList.new
