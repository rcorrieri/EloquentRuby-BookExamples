require 'pp'

# the inherited hook will fire when this class is inherited
class SimpleBaseClass
  def self.inherited( new_subclass )
    pp "Hey #{new_subclass} is now a subclass of #{self}"
  end
end

class ChildClassOne < SimpleBaseClass
  # self.inherited on SimpleBaseClass will fire
end

# the included hook works on modules, when it called we extend it 
# to make it a classmethod
module UsefulMethods
  module ClassMethods
    def a_class_method
      pp "Class Method has been called on #{self}"
    end
  end

  def self.included( host_class )
    pp "#{self} has been included!"
    host_class.extend( ClassMethods )
  end
end

class ChildClassOne
  include UsefulMethods
end

ChildClassOne.a_class_method

at_exit { pp "Program is exiting"}