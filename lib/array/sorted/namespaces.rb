
class ::Array::Sorted::Unique < ::Array::Unique
end

class ::UniqueArray::Sorted < ::Array::Sorted::Unique
end

::Array::Unique::Sorted = ::Array::Sorted::Unique

::SortedArray::Unique = ::UniqueArray::Sorted
