FILE = "day_2.txt"
Max_red, Max_green, Max_blue = 12, 13, 14

def is_possible?(game)
	reds = game.scan(/\d+ r/).map(&:to_i).max
	greens = game.scan(/\d+ g/).map(&:to_i).max
	blues = game.scan(/\d+ b/).map(&:to_i).max
	(reds <= Max_red and greens <= Max_green and blues <= Max_blue)
end

def part_one 
	file = File.open(FILE, "r")
	file.readlines.filter {|line| is_possible?(line)}.sum {|game| game[/\d+/].to_i}
end

def game_power(game)
	reds = game.scan(/\d+ r/).map(&:to_i).max
	greens = game.scan(/\d+ g/).map(&:to_i).max
	blues = game.scan(/\d+ b/).map(&:to_i).max
	reds * greens * blues
end

def part_two
	file = File.open(FILE, "r")
	file.readlines.sum {|line| game_power(line)}
end

puts part_one
puts part_two
