require 'pp'
require 'text'

# the method_missing will be called whenever you try to call a method that isn't there
class RepeatBackToMe
  def method_missing( method_name, *args )
    pp "You just called the #{method_name} method"
    pp "With these arguments: #{args.join(' ')}"
    pp "But that method doesn't exist"
  end
end

repeat = RepeatBackToMe.new()

repeat.solve_the_worlds_problems(2,3,4)



# this is an example of a class that will look for suitable callees for the asked for
# method
class Document

  def print
  end

  def method_missing( missing, *args )
    candidates = methods_that_sound_like( missing.to_s )

    message = "You called an undefined method: #{missing}."

    unless candidates.empty?
      message += "\nDid you mean #{candidates.join(' or ')}?"
    end

    raise raise NoMethodError.new( message )
  end

  def methods_that_sound_like( name )
    missing_soundex = Text::Soundex.soundex( name.to_s )
    public_methods.sort.find_all do |existing|
      existing_soundex = Text::Soundex.soundex( existing.to_s )
      missing_soundex == existing_soundex
    end
  end
end

doc = Document.new()
doc.prnt(1)
