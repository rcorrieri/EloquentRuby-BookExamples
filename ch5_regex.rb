require 'pp'

# in ruby regexes are defined by forward slashes
this_is_a_regex = /regex/

pp 'that object is a regex' if this_is_a_regex.is_a?(Regexp)

# the =~ operator finds matches of the reg and returns the index of the first occurance
letter_n_expression = /n/

pp letter_n_expression =~ 'cinco de quatro' # should return 2

# the . means any character
any_character_expression = /./
pp any_character_expression =~ 'a' # should return 0

two_characters_expression = /../
pp two_characters_expression =~ 'a' # will be nil because it's looking for TWO chars in succession

# the \ is used as the escape char.
dot_expression = /\./
pp dot_expression =~ 'google.com' # should be 6, that's where the dot is

four_letter_word_expression = /f..k/
pp four_letter_word_expression =~ 'go fork yourself' # should be 3 thats where the f word starts 

# characters inclosed in []'s are SETS and attempt to match any SINGLE digit contained in the set
even_number_expression = /[2468]/
pp even_number_expression =~ '01234' # should be 2, that is the position of the first number in the ser

# you can combine two of these to pull out time info
time_info_expression = /[aApP][mM]/

pp time_info_expression =~ '3:00 aM' # should be 5
pp time_info_expression =~ '3:00 Pm' # should be 5

# shortcuts exist for sets 
# \d = [0123456789]
# \w = any letter, number, or the _
# \s = any whitespace (space, tab, newline)
number_followed_by_a_letter_and_a_space_expression = /\d\w\s/
pp number_followed_by_a_letter_and_a_space_expression =~ 'I hate 3d movies' # should pick out 7, the start of '3d '

# you can use the | character to act as an or
time_expression = /\d\d:\d\d ([Aa]|[Pp])[Mm]/

pp time_expression =~ '07:43 pm' # should be 0
pp time_expression =~ '11:23 Am' # should also be 0

# the - can act as a range
five_or_greater_expression = /[5-9]/
pp five_or_greater_expression =~ 'the number 6' # should be 11 

# an * attempts to match 0 or more of the item that comes before it

hash_and_a_number_that_starts_with_one_expression = /#1\d*/

pp hash_and_a_number_that_starts_with_one_expression =~ 'will match #1' # 11
pp hash_and_a_number_that_starts_with_one_expression =~ 'will also match #10000' #16

# \A means the match must be anchored to the beginning of the string

starts_with_a_number = /\A\d/

pp starts_with_a_number =~ '3 little pigs' # should be 0
pp starts_with_a_number =~ 'pigs little 3' # should be nil

# \z means the match must be anchored to the end of the string

ends_with_a_number = /\d\z/

pp ends_with_a_number =~ '3 little pigs' # should be nil
pp ends_with_a_number =~ 'pigs little 3' # should be 12

multiple_line_string = <<-EOS
This is the First line
Second line
EOS

# ^ is similiar to /A but it looks at each line seperately
line_starts_with_S = /^S/
pp line_starts_with_S =~ multiple_line_string # Should be 23

# $ is similiar to /z but it looks at each line seperately
line_ends_with_e = /e$/
pp line_ends_with_e =~ multiple_line_string # should be 21


