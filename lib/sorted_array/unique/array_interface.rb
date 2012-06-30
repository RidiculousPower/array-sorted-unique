
module ::SortedArray::Unique::ArrayInterface

  include ::UniqueArray::Interface
  include ::SortedArray::Interface
  
  instances_identify_as!( ::UniqueArray::Sorted )
  instances_identify_as!( ::SortedArray::Unique )

end
