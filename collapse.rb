def same_char_collapse(str)
  collapsible = true

  while collapsible
    collapsible = false
    str = str.split('')
    str.each_index do |i|
      next unless str[i] == str[i + 1]

      collapsible = true
      str[i] = ''
      str[i + 1] = ''
    end
    str = str.join('')
  end
  puts str
end

same_char_collapse("jjjjrrrggdddwsnnndbbbbassdwwwfcvddttttt") 
