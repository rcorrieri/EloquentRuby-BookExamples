require 'pp'

class Document
  attr_accessor :content

  def initialize( content )
    @content = content
  end

  def to_s
    @content
  end

  def words
    @content.split
  end

  #overloading + operator,
  def +(other)
    if other.kind_of?(String)
      return Document.new("#{content} - #{other}")
    end
    Document.new("#{content} - #{other.content}")
  end

  #overloading the indexing operator
  def [](index)
    words[index]
  end

end

doc1 = Document.new("This is the first document")
doc2 = Document.new("This is the second document")

doc3 = doc1 + doc2

pp doc1
pp doc2
pp doc3 #has concatinated document info

pp doc3.words

pp doc1[3] # should be 'first'

doc4 = doc3 + 'Just adding a string'

pp doc4 # should include every listed string
