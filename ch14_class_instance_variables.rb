require 'pp'

class Document
  attr_accessor :title, :author, :content, :paper_size

  @@default_paper_size = :a4

  def self.default_paper_size
    @@default_paper_size
  end

  def self.default_paper_size=(new_size)
    @@default_paper_size = new_size
  end

  def initialize( title, author, content )
    @title = title
    @author = author
    @content = content
    @paper_size = Document.default_paper_size
  end
end

new_document = Document.new('Title','Author','Content')

pp Document.default_paper_size # should be :a4 
pp new_document.paper_size  # should be :a4

Document.default_paper_size = :a8

pp Document.default_paper_size # should be :a8
pp new_document.paper_size # should still be :a4

newer_document = Document.new('Title','Author','Content')

pp newer_document.paper_size # should be :a8 because it was created after we modified the class instance variable

class Resume < Document
end

new_resume = Resume.new('Title','Author','Content')

pp new_resume.paper_size # this will be :a8 becauase it looks up the inheritance chain to see what the size should be

# the gotcha here is if resume was meant to override the class instance variables in document, it must be loaded AFTER document


