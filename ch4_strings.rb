require 'pp'

# single quoted strings offer little interpretation
string_with_a_quote = 'Say it ain\'t so'

pp string_with_a_quote

# you can embed a backslash with a backslash
# book example says this should print one backslash, but output is showing 2!?
string_with_a_backslash = 'This is a backslash: \\ '

string_with_interpolation = "There is another string inside: #{string_with_a_quote}"

pp string_with_interpolation

# the %q just takes anything between the {}'s'
literal_string = %q{Q-Bert is the best \\@$$!#@$%%@#$"@"$ }

pp literal_string

# chomp cuts off the last trailing white space characters

pp "hello\n\n".chomp

# split creates an array split by the selected carachter

pp "make;this;into;an;array".split(';')

# sub replaces the first occurance
pp 'first first first first'.sub('first','second')

# gsub replaces all
pp 'first first first first'.gsub('first','second')