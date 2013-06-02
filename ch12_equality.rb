require 'pp'

class DocumentIdentifier
  attr_reader :folder, :name

  def initialize( folder, name )
    @folder = folder
    @name = name
  end
end

# a default equal comparison asks if 2 objects are the same

first = DocumentIdentifier.new( 'folder','name' )
second = DocumentIdentifier.new( 'folder','name' )

pp first == second # will be false
pp first == first # will be true

class DocumentIdentifier

  def ==(other)
    # we can also make this a little more generic by calling
    # other.respond_to?(:folder)
    return true if other.equal?(self)
    return false unless other.kind_of?(self.class)
    folder == other.folder && name == other.name
  end
end

pp first == second # it is true now after we redefined the == operator

class DocumentIdentifier

  # to make this class behave well when used as a hash key we need to implement 'hash' and 'eql?'
  def hash
    folder.hash ^ name.hash
  end

  def eql?(other)
    return false unless other.instance_of?(self.class)
    folder == other.folder && name == other.name
  end

end

# you can overide the <=> operator to give your classes comparison operator functionality
class NumberWrapper
  include Comparable
  attr_accessor :number

  def initialize( number )
    @number = number
  end

  def <=>(other)
    return false unless other.instance_of?(self.class)
    if other.number < number
      return 1
    elsif other.number == number
      return 0
    elsif other.number > number
      return -1
    end
  end
end

number_four = NumberWrapper.new(4)
number_six = NumberWrapper.new(6)

pp number_four < number_six # should be true
pp number_six > number_four # should be true

number_four.number = 6 # number_four is a lie

pp number_four == number_six # should be true

