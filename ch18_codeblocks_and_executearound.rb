require 'pp'

class Logger

  def debug(text)
    pp "DEBUG - #{text}"
  end

  def error(text)
    pp "ERROR - #{text}"
  end
end

class SomeApplication
  attr_writer :logger 
  attr_accessor :name

  def initialize
    @logger = Logger.new()
    yield(self) if block_given?
  end

  def do_something
    with_logging('load') { pp "Now doing some expensive loading operation..." }

    with_logging('crash') { 6 / 0 }

    with_logging('save') { pp "Now doing some expensive saving operation..."}

    pp with_logging('math operation') { 5 + 4 }
  end

  # this is an example of wrapping around an operation with logging
  def with_logging( description )
    begin
      @logger.debug( "#{@name} - Starting #{description}")
      return_value = yield
      @logger.debug( "#{@name} - Completed #{description}")
      return_value
    rescue Exception => e
      @logger.error("#{@name} - #{description} failed!!! - #{e}")
    end
  end
end

app = SomeApplication.new()

app.name = "Test App"

app.do_something

app2 = SomeApplication.new() do |app|
  app.name = "named with block"
end

app2.do_something

# this is a common pattern for execute around, connecting to a resource
def with_database_connection( connection_info )
  connection = Database.new( connection_info )
  begin
    yield( connection )
  ensure
    connection.close
  end
end
