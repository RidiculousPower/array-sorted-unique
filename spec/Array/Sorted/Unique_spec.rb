
require_relative '../../../lib/sorted-unique-array.rb'

describe ::Array::Sorted::Unique do

  ################
  #  initialize  #
  ################

  it 'can add initialize with an ancestor, inheriting its values and linking to it as a child' do
  
    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.instance_variable_get( :@parent_composite_object ).should == nil
    sorted_unique_array.should == []
    sorted_unique_array.push( :A, :B, :C, :D )

  end

  #########
  #  []=  #
  #########

  it 'can add elements' do
  
    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array[ 0 ] = :A
    sorted_unique_array.should == [ :A ]

    sorted_unique_array[ 1 ] = :B
    sorted_unique_array.should == [ :A, :B ]

    sorted_unique_array[ 0 ] = :D
    sorted_unique_array.should == [ :B, :D ]

  end
  
  ############
  #  insert  #
  ############

  it 'can insert elements' do
  
    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.insert( 3, :D )
    sorted_unique_array.should == [ nil, :D ]

    sorted_unique_array.insert( 1, :B )
    sorted_unique_array.should == [ nil, :B, :D ]

    sorted_unique_array.insert( 2, :C )
    sorted_unique_array.should == [ nil, :B, :C, :D ]

  end
  
  ##########
  #  push  #
  #  <<    #
  ##########
  
  it 'can add elements' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array << :A
    sorted_unique_array.should == [ :A ]

    sorted_unique_array << :B
    sorted_unique_array.should == [ :A, :B ]

  end
  
  ############
  #  concat  #
  #  +       #
  ############

  it 'can add elements' do

    # NOTE: this breaks + by causing it to modify the array like +=
    # The alternative was worse.

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.concat( [ :A ] )
    sorted_unique_array.should == [ :A ]

    sorted_unique_array += [ :B ]
    sorted_unique_array.should == [ :A, :B ]

  end

  ####################
  #  delete_objects  #
  ####################

  it 'can delete multiple elements' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array += [ :A, :B ]
    sorted_unique_array.should == [ :A, :B ]

    sorted_unique_array.delete_objects( :A, :B )
    sorted_unique_array.should == [ ]

  end

  #######
  #  -  #
  #######
  
  it 'can exclude elements' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A )
    sorted_unique_array.should == [ :A ]

    sorted_unique_array -= [ :A ]
    sorted_unique_array.should == [ ]

    sorted_unique_array.push( :B )
    sorted_unique_array.should == [ :B ]

  end

  ############
  #  delete  #
  ############
  
  it 'can delete elements' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A )
    sorted_unique_array.should == [ :A ]

    sorted_unique_array.delete( :A )
    sorted_unique_array.should == [ ]

    sorted_unique_array.push( :B )
    sorted_unique_array.should == [ :B ]

  end

  ###############
  #  delete_at  #
  ###############

  it 'can delete by indexes' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A )
    sorted_unique_array.should == [ :A ]
    
    sorted_unique_array.delete_at( 0 )
    sorted_unique_array.should == [ ]

    sorted_unique_array.push( :B )
    sorted_unique_array.should == [ :B ]

  end

  #######################
  #  delete_at_indexes  #
  #######################

  it 'can delete by indexes' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]

    sorted_unique_array.delete_at_indexes( 0, 1 )
    sorted_unique_array.should == [ :C ]

  end

  ###############
  #  delete_if  #
  ###############

  it 'can delete by block' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.delete_if do |object|
      object != :C
    end
    sorted_unique_array.should == [ :C ]

    sorted_unique_array.delete_if.is_a?( Enumerator ).should == true

  end

  #############
  #  keep_if  #
  #############

  it 'can keep by block' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.keep_if do |object|
      object == :C
    end
    sorted_unique_array.should == [ :C ]

  end

  ##############
  #  compact!  #
  ##############

  it 'can compact' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, nil, :B, nil, :C, nil )
    sorted_unique_array.should == [ nil, :A, :B, :C ]
    sorted_unique_array.compact!
    sorted_unique_array.should == [ :A, :B, :C ]

  end

  ##############
  #  flatten!  #
  ##############

  it 'can flatten' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, [ :F_A, :F_B ], :B, [ :F_C ], :C, [ :F_D ], [ :F_E ] )
    sorted_unique_array.should == [ :A, [ :F_A, :F_B ], :B, [ :F_C ], :C, [ :F_D ], [ :F_E ] ]
    sorted_unique_array.flatten!
    sorted_unique_array.should == [ :A, :B, :C, :F_A, :F_B, :F_C, :F_D, :F_E ]

  end

  #############
  #  reject!  #
  #############

  it 'can reject' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.reject! do |object|
      object != :C
    end
    sorted_unique_array.should == [ :C ]

    sorted_unique_array.reject!.is_a?( Enumerator ).should == true

  end

  #############
  #  replace  #
  #############

  it 'can replace self' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.replace( [ :D, :E, :F ] )
    sorted_unique_array.should == [ :D, :E, :F ]

  end

  ##############
  #  reverse!  #
  ##############

  it 'can reverse self' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.reverse!
    sorted_unique_array.should == [ :C, :B, :A ]

  end

  #############
  #  rotate!  #
  #############

  it 'can rotate self' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]

    sorted_unique_array.rotate!
    sorted_unique_array.should == [ :A, :B, :C ]

    sorted_unique_array.rotate!( -1 )
    sorted_unique_array.should == [ :A, :B, :C ]

  end

  #############
  #  select!  #
  #############

  it 'can keep by select' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.select! do |object|
      object == :C
    end
    sorted_unique_array.should == [ :C ]

    sorted_unique_array.select!.is_a?( Enumerator ).should == true

  end

  ##############
  #  shuffle!  #
  ##############

  it 'can shuffle self' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]

    first_shuffle_version = sorted_unique_array.dup
    sorted_unique_array.shuffle!
    sorted_unique_array.should == first_shuffle_version

  end

  ##############
  #  collect!  #
  #  map!      #
  ##############

  it 'can replace by collect/map' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.collect! do |object|
      :C
    end
    sorted_unique_array.should == [ :C, ]

    sorted_unique_array.collect!.is_a?( Enumerator ).should == true

  end

  ###########
  #  sort!  #
  ###########

  it 'can replace by collect/map' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.sort! do |a, b|
      if a < b
        1
      elsif a > b
        -1
      elsif a == b
        0
      end
    end
    sorted_unique_array.should == [ :A, :B, :C ]

    sorted_unique_array.sort!
    sorted_unique_array.should == [ :A, :B, :C ]

  end

  ##############
  #  sort_by!  #
  ##############

  it 'can replace by collect/map' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.sort_by! do |object|
      case object
      when :A
        :B
      when :B
        :A
      when :C
        :C
      end
    end
    sorted_unique_array.should == [ :A, :B, :C ]

    sorted_unique_array.sort_by!.is_a?( Enumerator ).should == true

  end

  ###########
  #  uniq!  #
  ###########

  it 'can remove non-unique elements' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array.push( :A, :B, :C, :C, :C, :B, :A )
    sorted_unique_array.should == [ :A, :B, :C ]
    sorted_unique_array.uniq!
    sorted_unique_array.should == [ :A, :B, :C ]

  end

  #############
  #  unshift  #
  #############

  it 'can unshift onto the first element' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array += :A
    sorted_unique_array.should == [ :A ]

    sorted_unique_array.unshift( :B )
    sorted_unique_array.should == [ :A, :B ]

  end

  #########
  #  pop  #
  #########
  
  it 'can pop the final element' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array += :A
    sorted_unique_array.should == [ :A ]

    sorted_unique_array.pop.should == :A
    sorted_unique_array.should == [ ]

    sorted_unique_array += :B
    sorted_unique_array.should == [ :B ]

  end

  ###########
  #  shift  #
  ###########
  
  it 'can shift the first element' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array += :A
    sorted_unique_array.should == [ :A ]

    sorted_unique_array.shift.should == :A
    sorted_unique_array.should == [ ]

    sorted_unique_array += :B
    sorted_unique_array.should == [ :B ]

  end

  ############
  #  slice!  #
  ############
  
  it 'can slice elements' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array += :A
    sorted_unique_array.should == [ :A ]

    sorted_unique_array.slice!( 0, 1 ).should == [ :A ]
    sorted_unique_array.should == [ ]

    sorted_unique_array += :B
    sorted_unique_array.should == [ :B ]

  end
  
  ###########
  #  clear  #
  ###########

  it 'can clear, causing present elements to be excluded' do

    sorted_unique_array = ::Array::Sorted::Unique.new

    sorted_unique_array += :A
    sorted_unique_array.should == [ :A ]

    sorted_unique_array.clear
    sorted_unique_array.should == [ ]

    sorted_unique_array += :B
    sorted_unique_array.should == [ :B ]

  end

  ##################
  #  pre_set_hook  #
  ##################

  it 'has a hook that is called before setting a value; return value is used in place of object' do
    
    class ::Array::Sorted::Unique::SubMockPreSet < ::Array::Sorted::Unique
      
      def pre_set_hook( index, object, is_insert = false )
        return :some_other_value
      end
      
    end
    
    sorted_unique_array = ::Array::Sorted::Unique::SubMockPreSet.new

    sorted_unique_array.push( :some_value )
    
    sorted_unique_array.should == [ :some_other_value ]
    
  end

  ###################
  #  post_set_hook  #
  ###################

  it 'has a hook that is called after setting a value' do

    class ::Array::Sorted::Unique::SubMockPostSet < ::Array::Sorted::Unique
      
      def post_set_hook( index, object, is_insert = false )
        return :some_other_value
      end
      
    end
    
    sorted_unique_array = ::Array::Sorted::Unique::SubMockPostSet.new

    sorted_unique_array.push( :some_value ).should == [ :some_other_value ]
    
    sorted_unique_array.should == [ :some_value ]
    
  end

  ##################
  #  pre_get_hook  #
  ##################

  it 'has a hook that is called before getting a value; if return value is false, get does not occur' do
    
    class ::Array::Sorted::Unique::SubMockPreGet < ::Array::Sorted::Unique
      
      def pre_get_hook( index )
        return false
      end
      
    end
    
    sorted_unique_array = ::Array::Sorted::Unique::SubMockPreGet.new
    
    sorted_unique_array.push( :some_value )
    sorted_unique_array[ 0 ].should == nil
    
    sorted_unique_array.should == [ :some_value ]
    
  end

  ###################
  #  post_get_hook  #
  ###################

  it 'has a hook that is called after getting a value' do

    class ::Array::Sorted::Unique::SubMockPostGet < ::Array::Sorted::Unique
      
      def post_get_hook( index, object )
        return :some_other_value
      end
      
    end
    
    sorted_unique_array = ::Array::Sorted::Unique::SubMockPostGet.new
    
    sorted_unique_array.push( :some_value )
    sorted_unique_array[ 0 ].should == :some_other_value
    
    sorted_unique_array.should == [ :some_value ]
    
  end

  #####################
  #  pre_delete_hook  #
  #####################

  it 'has a hook that is called before deleting an index; if return value is false, delete does not occur' do
    
    class ::Array::Sorted::Unique::SubMockPreDelete < ::Array::Sorted::Unique
      
      def pre_delete_hook( index )
        return false
      end
      
    end
    
    sorted_unique_array = ::Array::Sorted::Unique::SubMockPreDelete.new
    
    sorted_unique_array.push( :some_value )
    sorted_unique_array.delete_at( 0 )
    
    sorted_unique_array.should == [ :some_value ]
    
  end

  ######################
  #  post_delete_hook  #
  ######################

  it 'has a hook that is called after deleting an index' do
    
    class ::Array::Sorted::Unique::SubMockPostDelete < ::Array::Sorted::Unique
      
      def post_delete_hook( index, object )
        return :some_other_value
      end
      
    end
    
    sorted_unique_array = ::Array::Sorted::Unique::SubMockPostDelete.new
    
    sorted_unique_array.push( :some_value )
    sorted_unique_array.delete_at( 0 ).should == :some_other_value
    
    sorted_unique_array.should == [ ]
    
  end

end
