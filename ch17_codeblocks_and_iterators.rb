require 'pp'

# yield will return what comes from the block, and block_given? will determine if 
# a block was passed to it
def get_block_value
  if block_given?
    value = yield
    pp "The block returned #{value}"
  end
end

get_block_value { 5 * 50 }

def multiply_result_by( number )

  return number unless block_given?
  value = yield
  value * number

end

pp multiply_result_by(5) { 1 * 2 }

# making a naive iterator
def each_number_to( number )

  index = 0
  while index < number
    yield(index)
    index += 1
  end

end

each_number_to(5) { |number| pp number }

# by including 'Enumerable' and defining an each method, we can access more functionality 
# http://ruby-doc.org/core-2.0/Enumerable.html

class Document
  include Enumerable
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

  def each
    words.each { |word| yield( word ) }
  end
end

new_document = Document.new('title','author','here is some content with words')

# we now get these and more
pp new_document.any? { |word| word == 'some' }
pp new_document.sort_by { |word| word.length}
