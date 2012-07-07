
require 'array/sorted'
require 'array/unique'
#require_relative '../../../../array-unique/lib/array-unique.rb'
#require_relative '../../../../array-sorted/lib/array-sorted.rb'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Array::Sorted::Unique < ::Array::Hooked
  
  include ::Array::Sorted::Unique::ArrayInterface
    
end
