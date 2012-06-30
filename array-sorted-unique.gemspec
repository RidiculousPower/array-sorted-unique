require 'date'

Gem::Specification.new do |spec|

  spec.name                      =  'array-sorted-unique'
  spec.rubyforge_project         =  'array-sorted-unique'
  spec.version                   =  '1.0.0'

  spec.summary                   =  "Provides Array::Sorted::Unique and its alias Array::Unique::Sorted as well as UniqueSortedArray and its alias SortedUniqueArray."
  spec.description               =  "A subclass of Array::Sorted and Array::Unique (and therefore also Array::Hooked)."

  spec.authors                   =  [ 'Asher' ]
  spec.email                     =  'asher@ridiculouspower.com'
  spec.homepage                  =  'http://rubygems.org/gems/array-sorted-unique'

  spec.add_dependency            'array-sorted'
  spec.add_dependency            'array-unique'

  spec.date                      = Date.today.to_s
  
  spec.files                     = Dir[ '{lib,spec}/**/*',
                                        'README*', 
                                        'LICENSE*',
                                        'CHANGELOG*' ]

end
