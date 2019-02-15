def ice_cream_shop(flavors, favorite)
  return true if flavors[0] == favorite
  return false if flavors.empty?

  flavors.shift
  ice_cream_shop(flavors, favorite)
end

p ice_cream_shop(['vanilla', 'strawberry'], 'blue moon')
