require 'pp'

class Document
  attr_accessor :title, :authors, :content

  def initialize(title, author, content)
    @title = title
    @authors = author
    @content = content
  end
end

# classes can be re-opened and added to at will
class Document
  def words
    @content.split
  end

  def word_count
    words.size
  end
end

doc = Document.new('title','author','this is content')

pp doc.word_count # should be called and returned 3

class Document
  alias_method :number_of_words, :word_count
end

pp doc.number_of_words