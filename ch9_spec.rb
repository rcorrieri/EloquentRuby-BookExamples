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

class PrintableDocument < Document
  def print( printer )
    return 'Printer Unavailable' unless printer.available?
    printer.render( author )
    printer.render( title )
    printer.render( content )
    'Done'
  end
end


describe Document do
  before :each do
    @text = 'A bunch of words'
    @doc = Document.new( 'test', 'nobody', @text )
  end

  it 'should hold on to the contents' do
    @doc.content.should == @text
  end

  it 'should know which words it has' do
    @doc.words.should include( 'A' )
    @doc.words.should include( 'bunch' )
    @doc.words.should include( 'of' )
    @doc.words.should include( 'words' )
    @doc.words.should include( 'A' )
  end

  it 'should know how many words it contains' do
    @doc.word_count.should == 4
  end
end

describe PrintableDocument do
  before :each do
    @text = 'A bunch of words'
    @doc = PrintableDocument.new( 'test','nobody', @text )
  end

  it 'should know how to print itself' do
    # a stub just allows calls to methods on an object to return specific values
    stub_printer = stub :available? => true, :render => nil
    @doc.print( stub_printer ).should == 'Done'
  end

  it 'should print' do
    # a mock also keeps info about how it has been accessed
    mock_printer = mock('Printer')
    mock_printer.should_receive(:available?).and_return(true)
    mock_printer.should_receive(:render).exactly(3).times
    @doc.print( mock_printer ).should == 'Done'
  end
end
