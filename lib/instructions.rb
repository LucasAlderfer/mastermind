class Instructions

  def initialize
    instructions
  end

  def instructions
    puts "The Mastermind will create a secret code based on the difficulty level you select."
    puts "Once you make a guess, the Mastermind will tell you how many of the elements of the code you have correct,"
    puts "as well as how many of those elements are in the correct position in the code."
    puts "You may use as many, or none, of one character as you would like."
    puts "You can quit at any time by entering 'q' or 'quit'."
    puts "If you get stuck on a secret code and would like to see it, you can cheat by entering 'c' or 'cheat'."
    puts "Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
    print "> "
  end
end
