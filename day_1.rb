FILE = "day_1.txt"
DIGITS = {"one" => "1", "two" => "2", "three" => "3", "four" => "4", "five" => "5", "six" => "6", "seven" => "7", "eight" => "8", "nine" => "9"}


# Takes a string that is either a digit, either written out or a numeral
# Returns the digit as a numeral, in string form
def digit_from_string(string)
	return (DIGITS.has_key?(string) ? DIGITS[string] : string)
end


def partone() 
	file = File.open(FILE, "r")
	return file.readlines.map {|x| (x[/\d/] + x.reverse[/\d/]).to_i}.sum
end


# I need to use a positive lookahead to catch if two numbers are joined e.g. threeight
# A result of this is that line.scan returns an array of arrays, like [[1, one, 2, three, eight]]
# That's why the flatten is there
def parttwo()
	regex = Regexp.new("(?=(" + DIGITS.keys.join("|") + "|\\d))")
	file = File.open(FILE, "r")
	return file.readlines.map {|line| 
		a = line.scan(regex).flatten
		(digit_from_string(a[0]) + digit_from_string(a[-1])).to_i
	}.sum
end

puts partone()
puts parttwo()