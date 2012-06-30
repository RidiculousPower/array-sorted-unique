
module ::Array::Sorted::Unique::ArrayInterface
  
  include ::Array::Unique::ArrayInterface
  include ::Array::Sorted::ArrayInterface
  
  instances_identify_as!( ::Array::Sorted::Unique )
  instances_identify_as!( ::Array::Unique::Sorted )
  
end
