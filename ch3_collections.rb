require 'pp'


this_is_a_hash = { :one => 1, :two => 2, :three => 3 }
this_is_an_array =  [ 1, 2, 3, 4, 5, 6 ]

# you can pass any number of arguments to a method 
def echo_all( *args )
  args.each { |arg| pp arg }
end

# the * is the 'greedy' operator 
def echo_at_least_two( first_arg, *middle_args, last_arg)
  pp "The first argument is #{first_arg}"
  middle_args.each { |arg| pp "A middle argument is #{arg}" }
  pp "The last argument is #{last_arg}"
end

echo_all(1,2,"string")
echo_all(this_is_a_hash)
echo_all(this_is_an_array)

# if you only hass 2 arguments to the echo_at_least_two method it assigns the non *'d ones first
echo_at_least_two(1,2)

# if it has 3 it will assign everything in the middle to "middle_args"
# the * is referred to as a 'splat'
echo_at_least_two(1,2,3,4,5,6,Fixnum)

# we can also pass hashes like so:
def create_book( bookinfo_hash )
  name = bookinfo_hash[:name]
  author = bookinfo_hash[:author]

  puts "#{name}, written by #{author}"
end

create_book( { :name => 'Slaughterhouse-Five', :author => 'Kurt Vonnegut'})

# for further clarity the braces/parens can be removed

create_book :name => 'Slaughterhouse-Five', :author => 'Kurt Vonnegut'

# we can shorten an array of strings with the %w shortcut

words = %w{ This will become an array with an item for each word }

words.each { |word| pp word }

# the map option projects one enumerable to another one

letter_count_per_word = words.map { |word| word.size }

pp letter_count_per_word

# inject is used to reduce a collection down to a single value
count_of_all_letters = letter_count_per_word.inject(0) { |sum, word| sum += word }

pp count_of_all_letters

# the ! is the key that you are doing an operation that modifies the value,
# in this case the words will be reversed.
words.reverse!

pp words

