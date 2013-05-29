falseItem = false

# regular if statement
if falseItem
  puts "This is True"
end

# if not leads us possible double negative territory
if not falseItem
  puts "This is Not Not False"
end

# for this reason there is the 'unless' keyword, which means only execute if this is false
unless falseItem
  puts 'This only happens when the item is false'
end

# there is also a corellary for the 'while' statement.  Instead of 'while not' there is 'until'
until falseItem
  puts 'falseitem is still false'
  falseItem = true
end

# the ternary operator works in ruby
name = "Bill"

puts (name == 'Bill' ? 'of course it is bill' : 'not bill')

# you can also write if statements after the code to be executed
puts name unless name == 'Bill' # will not be printed
puts name + '!' if name == 'Bill' # will be printed


fonts = [ 'courier', 'times roman', 'helvetica' ]

for font in fonts
  puts font
end

# the above for item loop works in ruby, but it is more idiomatic to do the below 2
# code
fonts.each do |font|
  puts font
end

# evaulations are allowed in case statements.  it will stop at the first case it finds
numberFour = 4

case numberFour
when 2 + 3
  puts '2 + 3 is 5!'
when 5 - 1
  puts '5 - 1 is 4!'
when 8 / 2
  puts 'This also evaluates to the number 4!'
when 4
  puts 'this is the number 4'
end

# you can also evaluate multiple values per when statement
case numberFour
when 2 + 2, 5
  puts 'It found 2 + 2, or 5'
when 4,5
  puts 'It found 4, or 5'
end

# else is the default case
case numberFour
when 5
  puts 'This found 5!'
else
  puts 'case not listed!'
end

# wow, this can also be used for identifying the object type as well.
case numberFour
when Fixnum
  puts "This is a Fixnum"
when Object
  puts 'This is an object, because everything is'
end

