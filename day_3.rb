FILE = "day_3.txt"
Input = File.open(FILE).readlines.map(&:rstrip)
Size_x = Input[0].length - 1
Size_y = Input.length - 1

def is_valid?(startx, endx, column)
	border_x = [[0, startx - 1].max, [endx + 1, Size_x].min]
	border_y = [[0, column-1].max, [column+1, Size_y].min]
	border_chars = Input[border_y[0]][border_x[0]..border_x[1]]
	border_chars += Input[column][border_x[0]..border_x[1]]
	border_chars += Input[border_y[1]][border_x[0]..border_x[1]]
	puts border_chars
	border_chars =~ /[^\d\.]/ ? true : false
end

def part_one
	Input.each_with_index.map { |line, index|
		line.to_enum(:scan, /\d+(?!\d)/).map { Regexp.last_match }
		.filter{|match| 
			is_valid?(match.offset(0)[0], match.offset(0)[1]-1, index)}
		.map{|match| 
			match[0].to_i}
		.sum
	}.sum
end

# def get_adjacent_gears(startx, endx, column)
# 	border_x = [[0, startx - 1].max, [endx + 1, Size_x].min]
# 	border_y = [[0, column-1].max, [column+1, Size_y].min]

# end

# def gear_list
# 	Input.each_with_index.map {|line, index| 
# 		line.to_enum(:scan, /\d+(?!\d)/).map {Regexp.last_match}
# 		.each {|number| 

# 		}
# 	}
# end



Gear = Struct.new(:x, :y, :neighbours)
def get_gears 
	Input.each_with_index.map{|line, index|
		line.to_enum(:scan, /\*/).map{Regexp.last_match}
		.map{|match| Gear.new(match.offset(0)[0], index, [])}
	}
end

def check_gear(x, y)

def get_neighbouring_gears(startx, endx, column)
	border_x = [[0, startx - 1].max, [endx + 1, Size_x].min]
	border_y = [[0, column-1].max, [column+1, Size_y].min]
	chars_above = Input[border_y[0]][border_x[0]..border_x[1]]

	# border_chars = Input[border_y[0]][border_x[0]..border_x[1]]

end

def part_two
	Input.each_with_index.map{|line, index| 
		line.to_enum(:scan, /\d+(?!\d)/).map { Regexp.last_match }
		.filter{|match| 
			is_valid?(match.offset(0)[0], match.offset(0)[1]-1, index)}
		.map{|match| 
			match[0].to_i}
		.sum
	}.sum
	}
end
puts part_one
puts part_two

# For each number
# If above has a gear, add co-ordinates of it to an array, third value is the number
# if left or right is a gear, do the same
# if below is a gear, do the same
# run through the list
# if any coordinates appear exactly twice, do the maths
# finding the neighbouring gears is going to involve searching the string for a gear, 
# finding the offset from the start of the string, adding the offsets from the start of the line, 
# The gears won't be ordered in the final list
# Perhaps they could be sorted by x or by y first, or maybe there's a convenient 
# function that would let us find identical x, y gears