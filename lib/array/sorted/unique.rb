
require 'array/sorted'
require 'array/unique'

# namespaces that have to be declared ahead of time for proper load order
require_relative './namespaces'

# source file requires
require_relative './requires.rb'

class ::Array::Sorted::Unique < ::Array::Unique
  
  include ::Array::Sorted::Unique::ArrayInterface
    
end
