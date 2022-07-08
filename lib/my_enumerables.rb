module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    my_each do |el|
      yield el, i
      i += 1
    end
    self
  end

  def my_select
    selected_arr = []
    my_each { |el| selected_arr << el if yield el }
    selected_arr
  end

  def my_all?
    my_each { |el| return false unless yield(el) }
    true
  end

  def my_any?
    my_each { |el| return true if yield(el) }
    false
  end

  def my_none?
    my_each { |el| return false if yield(el) }
    true
  end

  def my_count
    return size unless block_given?

    count = 0
    my_each { |el| count += 1 if yield(el) }
    count
  end

  def my_map
    new_arr = []
    my_each { |el| new_arr << yield(el) }
    new_arr
  end

  def my_inject(sum = 0)
    my_each { |el| sum = yield(sum, el) }
    sum
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for el in self
      yield el
    end
    self
  end
end
