class Node
  attr_accessor :value, :next_node

  def initialize(value = nil)
    @value = value
    @next_node = nil
  end
end

class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      node = @head

      while node.next_node
        node = node.next_node
      end

      node.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      new_node.next_node = @head
      @head = new_node
    end
  end

  def size
    number_nodes = 0
    node = @head

    while node
      number_nodes += 1
      node = node.next_node
    end

    number_nodes
  end

  def head
    @head
  end

  def tail
    node = @head

    while node&.next_node
      node = node.next_node
    end

    node
  end

  def at(index)
    return nil unless index.is_a?(Integer) &&  size > index

    node = @head

    index.times do
      node = node.next_node
    end

    node
  end

  def pop
    return nil if @head.nil?

    last_node = tail
    node = @head

    if node == last_node
      @head = nil
      return last_node
    end

    until node.next_node == last_node
      node = node.next_node
    end

    node.next_node = nil
    last_node
  end

  def contains?(value)
    node = @head

    while node
      return true if node.value == value
      node = node.next_node
    end

    false
  end

  def find(value)
    i = 0
    node = @head

    while node
      return i if node.value == value
      node = node.next_node
      i += 1
    end

    nil
  end

  def to_s
    string = ""
    node = @head

    while node
      string << "( #{node.value} ) -> "
      node = node.next_node
    end

    string << 'nil'
    string
  end

  def insert_at(value, index)
    return nil unless index.is_a?(Integer) &&  size >= index

    if @head.nil? || index == 0
      prepend(value)
    else
      new_node = Node.new(value)
      new_node.next_node = at(index)
      at(index - 1).next_node = new_node
    end

    self
  end

  def remove_at(index)
    return nil unless index.is_a?(Integer) &&  size > index

    removed_node = at(index)

    if @head == tail
      @head = nil
    elsif index == 0
      @head = removed_node.next_node
    else
      at(index - 1).next_node = removed_node.next_node
    end

    removed_node
  end
end
