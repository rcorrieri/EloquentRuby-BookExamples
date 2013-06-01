require 'pp'

class Document

  private

  def word_count
    return 4
  end

  def print_number(num)
    return num
  end
end

doc = Document.new()

# this will cause a NoMethodErrorException
# doc.word_count

# however we can get around this by calling send on the object with the symbol of what we are calling
pp doc.send( :word_count )

# can also be written like __send__ to distinguish itself from "send" which is a common verb used
# for other actions, so if you have like an emailSender class that sends
pp doc.__send__( :print_number, 6)

# you can autocreate basic accessor methods

class Person
  attr_accessor :salary
  attr_reader :name
  attr_writer :password
end

# inherit with the < 

class Employee < Person
end

emp = Employee.new()

emp.salary = 2

pp emp.salary