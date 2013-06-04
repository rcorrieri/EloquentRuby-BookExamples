# this example creates a method dynamically when the user asks for it
# 

require 'pp'

class Document
  attr_accessor :content

  def replace_word( old_word, new_word )
    @content.gsub!( old_word, "#{new_word}")
  end

  def method_missing( name, *args )
    string_name = name.to_s
    raise NoMethodError unless string_name =~ /^replace_\w+/
    old_word = extract_old_word(string_name)
    replace_word( old_word, args.first)
  end

  def extract_old_word( name )
    name_parts = name.split('_')
    name_parts[1]
  end
end

doc = Document.new()

doc.content = "The document has these words in it"

doc.replace_has "doesn't have"

puts doc.content

