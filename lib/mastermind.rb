require 'pry'
require './lib/instructions.rb'
require './lib/predifficulty.rb'
require './lib/guess_count.rb'
require './lib/difficulty.rb'
require './lib/compare.rb'
require './lib/win.rb'

puts "Welcome to MASTERMIND\n"
puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
puts "> "
def start
  choice = gets.chomp
  if choice == "p" || choice == "play" || choice == "P" || choice == "Play"
    predifficulty
  elsif choice == "q" || choice == "quit" || choice == "Q" || choice == "Quit"
    print "Quitting Now."
    exit
  elsif choice == "i" || choice == "instructions" || choice == "I" || choice == "Instructions"
    Instructions.new
    start
  else
    print "Invalid entry: Would you like to (p)lay, read the (i)nstructions, or (q)uit?\n> "
    start
  end
end
def predifficulty
  PreDifficulty.new
  assign_difficulty
end
def assign_difficulty
  t = GuessCount.new
  x = Difficulty.new(gets.chomp)
  if x.valid_difficulty == false
    predifficulty
  else
    compare_guess(x, t)
  end
end
def compare_guess(x, t)
  code = x  #An instance of Difficulty with its instance variables as methods
  guesses = t #An instance of GuessCount, which only has an empty array as an attribute
  y = Compare.new(gets.chomp, code, guesses)
  if y.correct_position < y.info[0].length
    compare_guess(code, guesses)
  else
    victory(y)
  end
end
def victory(y)
  code = y
  Win.new(code)
  postgame
end
def postgame
  puts "Do you want to (p)lay again, or (q)uit?"
  choice = gets.chomp
  if choice == "p" || choice == "play" || choice == "P" || choice == "Play"
    predifficulty
  elsif choice == "q" || choice == "quit" || choice == "Q" || choice == "Quit"
    print "Quitting Now."
    exit
  else
    print "Invalid entry: Do you want to (p)lay again, or (q)uit?\n> "
    postgame
  end
end
start
