require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'sorted-unique-array'
  spec.rubyforge_project         =  'sorted-unique-array'
  spec.version                   =  '1.0.0'

  spec.summary                   =  "Provides Array::Sorted::Unique and its alias Array::Unique::Sorted as well as UniqueSortedArray and its alias SortedUniqueArray."
  spec.description               =  "A subclass of Array::Sorted and Array::Unique (and therefore also Array::Hooked)."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/sorted-unique-array'

  spec.add_dependency            'sorted-array'
  spec.add_dependency            'unique-array'

  spec.date                      = Date.today.to_s
  
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*',
                                        'CHANGELOG*' ]

end
