require 'pp'

module WordProcessor
  class Document
    attr_accessor :content

    def initialize( content )
      @content = content
    end

  end
  
  def self.points_to_inches( points )
    points / 72.0
  end
end

pp WordProcessor.points_to_inches(33)

# this is how to acess classes inside a module
new_document = WordProcessor::Document.new('content')

pp new_document.content

# you can use modules as variables
word_processor_module = WordProcessor

new_document = word_processor_module::Document.new('content')

pp new_document.content

# use case for this is, lets say you had multiple modules with simliar functionality
# you can define the module at runtime and switch out behaviors