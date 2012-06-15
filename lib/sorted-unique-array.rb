
require 'sorted-array'
require 'unique-array'

class ::Array::Sorted::Unique < ::Array::Unique
end
class ::UniqueArray::Sorted < ::Array::Sorted::Unique
end
::Array::Unique::Sorted = ::Array::Sorted::Unique
::SortedArray::Unique = ::UniqueArray::Sorted

basepath = 'sorted-unique-array/Array/Sorted/Unique'

files = [
  
  'Interface'
  
]

second_basepath = 'sorted-unique-array/UniqueArray/Sorted'

second_files = [
  
  'Interface'
  
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end
second_files.each do |this_file|
  require_relative( File.join( second_basepath, this_file ) + '.rb' )
end

require_relative( basepath + '.rb' )
require_relative( second_basepath + '.rb' )
