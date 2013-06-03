require 'pp'

# this is a module we can 'mixin' to the class, notice it has no dependency on any class
# it just requires/assumes the class will have a 'content' variable it can access

module WritingQuality

  CLICHES = [ /play fast and loose/,
              /make no mistake/,
              /does the trick/,
              /off and running/,
              /my way or the highway/ ]

  def number_of_cliches
    CLICHES.inject(0) do |count, phrase|
      count += 1 if phrase =~ content
      count
    end
  end
end

class Document
  include WritingQuality
  attr_accessor :content

  def initialize( content )
    @content = content
  end

end

text = "my way or the highway does the trick"

cliche_document = Document.new(text)

pp cliche_document.number_of_cliches # should be 2

# class variables will overwrite mixin variables
class PoliticalDocument < Document
  def number_of_cliches
    0
  end
end

political_document = PoliticalDocument.new(text)

pp political_document.number_of_cliches # should be 0