class Array
  def deep_dup
    new_array = []
    each do |elem|
      new_array << (elem.is_a?(Array) ? elem.deep_dup : elem)
    end
    new_array
  end
end
