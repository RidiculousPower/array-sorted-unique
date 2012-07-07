
module ::Array::Sorted::Unique::ArrayInterface
  
  include ::Array::Sorted::ArrayInterface
  include ::Array::Unique::ArrayInterface
  
  instances_identify_as!( ::Array::Sorted::Unique )
  instances_identify_as!( ::Array::Unique::Sorted )
  
end
