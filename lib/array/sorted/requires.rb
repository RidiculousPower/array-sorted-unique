# -*- encoding : utf-8 -*-

basepath = 'unique'

files = [
  
  'array_interface'
  
]

files.each do |this_file|
  require_relative( File.join( basepath, this_file ) + '.rb' )
end
