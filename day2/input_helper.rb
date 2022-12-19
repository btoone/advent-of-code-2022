# A runner that yields to the block passed in. Reads in from the same input
# files which are always used as the argument for the block. Able to switch
# between sample only and sample + input files based on the boolean flag
# argument.
# 
# The block can be passed either implicitly or as an explicit argument.
def call(sample: false, expected: nil, &solution)
  puts
  puts "RESULTS\n"
  puts '========='
  puts 'Sample output:'

  lines = File.readlines('sample.txt', chomp: true)

  # yield to the block from main.rb passing in "lines" as the argument
  actual = yield lines

  # print the output in a helpful way for testing
  puts output(actual, expected)
  
  unless sample
    puts
    puts 'Final output:'

    # Overwrite "lines" with the real input
    lines = File.readlines('input.txt', chomp: true)

    puts yield lines
  end
  puts
end

def output(actual, expected)
  # if expected.nil?
  #   actual
  # else
  #   (actual == expected ? "Pass: #{actual}" : "Fail: #{actual}")
  # end
  return actual if expected.nil?

  (actual == expected ? "#{actual} (pass)" : "#{actual} (fail)")
end
