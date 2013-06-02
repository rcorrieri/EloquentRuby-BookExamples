require 'pp'

class Document
  attr_accessor :title, :author, :content

  def initialize( title, author, content )
    @title = title
    @author = author
    @content = content
  end

  def words
    @content.split
  end

  def word_count
    words.size
  end
end


# singleton methods are methods that are defined for exactly one object instance
# in contrast to the 'design patterns' definition of singleton, where there is only one instance
# of a specified object.

# a secret singleton class sits above every standard object

# another name for singleton methods is class methods 

# this is a method on an object
my_object = Document.new('War and Peace','Tolstoy','a whole lot of pages')

def my_object.explain
  pp "self is #{self}"
  pp "and it's class is #{self.class}"
end

my_object.explain

# this is a method on a class, aka a singleton method
def Document.explain
  pp "self is #{self}"
  pp "and it's class is #{self.class}"
end

Document.explain

# you can define singleton methods in the class like this:
class Document
  class << self
    def yell
      pp "This document is mad as hell and it's not going to take it anymore"
    end

    def default_document
      Document.new('Default Title','Default Author','Default Content')
    end
  end
end

Document.yell

new_document = Document.default_document

pp new_document.title #should be "Default Title"