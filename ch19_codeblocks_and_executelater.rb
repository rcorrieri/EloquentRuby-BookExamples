require 'pp'

def run_block( &that_block )
  pp 'about to run block'
  that_block.call
  pp 'done running'
end

run_block { pp 'Code in block'}

# using this technique as a callback
class Document
  attr_accessor :load_listener

  def on_save( &block )
    @save_listener = block
  end

  def on_load( &block )
    @load_listener = block
  end

  def load( text )
    @content = text
    @load_listener.call( self, text ) if @load_listener
  end

  def save( text )
    # save operation
    @save_listener.call( self, text ) if @save_listener
  end
end

doc = Document.new()

doc.on_load { pp 'This is the on load callback' }
doc.on_save { pp 'This is the on save callback' }

doc.load('Load this text')
doc.save('Save the text')

# you can save functions as objects
new_load_listener = lambda do |doc, path|
  pp 'dynamic load listener'
end

doc.load_listener = new_load_listener

doc.load('Overwrote load listener')

# using a block for lazy initialization

class TakesLongToInstantiate

  def initialize( &block )
    pp 'initialize called'
    @initizer_block = block
  end

  def content
    if @initizer_block
      @content = @initizer_block.call
      @initizer_block = nil
    end
    @content
  end
end

long_init = TakesLongToInstantiate.new() { pp 'Pretend this is an operation that takes a long time'; 4}

pp long_init.content
