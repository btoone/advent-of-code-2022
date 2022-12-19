require_relative 'input_helper.rb'

SHAPES = {
  'A' => 1, 
  'X' => 1, 
  'B' => 2, 
  'Y' => 2, 
  'C' => 3, 
  'Z' => 3, 
}.freeze

# main implementation
def solution(lines)
  points = 0
  pairs = []
  
  # pairs => [["A", "Y"], ["B", "X"], ["C", "Z"]]
  lines.map { |line| line.split }.each do |a, b|
    points += SHAPES[b]

    # lookup multiple values using hash's #to_proc
    points += score(*[a,b].map(&SHAPES))
    
    # p "DEBUG: [#{a}, #{b}] => #{points}"
  end

  points
end

def score(a, b)
  return 3 if a == b
  return 6 if win? a, b
  0 # a loss
end

# TODO figure the second part of the challenge
def strategy(a, outcome)
  if outcome == 2 # draw
  elsif outcome == 3 # win
  else
    # lose
  end
end

def win?(a, b)
  rock = -> (a, b) { b == 1 && a == 3 }
  paper = -> (a, b) { b == 2 && a == 1 }
  scissors = -> (a, b) { b == 3 && a == 2 }

  rock.call(a, b) || paper.call(a, b) || scissors.call(a, b)
end

# Execute the solution with sample input for the first part and the
# expected result. Using the implicit block syntax to pass the block.
call(sample: true, expected: 18) do |lines|
  solution(lines)
end

# Alternative way of executing the solution. Pass the block as a 
# special lambda argument.
# part1: 11386
solution2 = -> (lines) { solution(lines) }
call &solution2


__END__

(3 + 3) = 6
(2 + 3) = 5
(1 + 0) = 1
(3 + 6) = 9
(2 + 0) = 2
(2 + 3) = 5
(3 + 3) = 6
(3 + 3) = 6
(2 + 3) = 5
(1 + 0) = 1
total: 46

Rock   Paper   Scissors
A        B        C
X        Y        Z
1        2        3

A X => draw (1, 3) = 4
A Y =>  win (2, 6) = 8

# rock beats scissors
A Z =>  loss (3, 0) = 3

B X => loss (1, 0) = 1
B Y => draw (2, 3) = 5

# paper loses to scissors
B Z =>  win (3, 6) = 9

C X => loss (1, 0) = 1

# scissors beats paper
C Y => loss (2, 0) = 2

C Z => draw (3, 3) = 6
