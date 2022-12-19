# Answers: 
# 66616
# [66616, 66306, 66250] => 199172

def most_calories lines, sorted = nil
  elves = [] 
  lines.map(&:to_i).inject do |memo, calories|
    if calories.zero? 
      elves << memo
      memo = 0
    end
  
    memo + calories
  end
  # p elves
  elves.max(sorted)
end

lines = File.readlines("sample.txt", chomp: true)
lines = File.readlines("input.txt", chomp: true)
# p lines
# p lines.map(&:to_i)
p most_calories lines
p most_calories(lines, 3)

# elves = [] 
# DATA.inject(0) do |memo, line|
#   calories = line.to_i
  
#   if calories.zero? 
#     elves << memo
#     memo = 0
#   end

#   memo + calories
# end

# # p elves
# p elves.max(3).sum

# __END__
# 
