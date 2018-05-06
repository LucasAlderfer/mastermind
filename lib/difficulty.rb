require 'pry'
require './lib/compare.rb'
require './lib/guess_count.rb'

class Difficulty
  attr_accessor :characters,
                :code,
                :start,
                :valid_difficulty,
                :choice,    ###This accessor and below are all only needed for testing
                :num,
                :size,
                :level,
                :valid_difficulty

  def initialize(x)
    @difficulty = x
    @choice
    @num
    @level
    @size
    @characters
    @code = []
    @start = Time.now
    @valid_difficulty = nil
    set_difficulty
  end

  def set_difficulty
    if @difficulty == "b" || @difficulty == "B" || @difficulty == "beginner" || @difficulty == "Beginner"
      @level = "beginner"
      @choice = "(r)ed, (g)reen, (b)lue, and (y)ellow"
      @num = "four"
      @size = 4
      @characters = ["r", "g", "b", "y"]
      randomfill
    elsif @difficulty == "i" || @difficulty == "I" || @difficulty == "intermediate" || @difficulty == "Intermediate"
      @level = "intermediate"
      @choice = "(r)ed, (g)reen, (b)lue, (y)ellow, and (w)hite"
      @num = "six"
      @size = 6
      @characters = ["r", "g", "b", "y", "w"]
      randomfill
    elsif @difficulty == "a" || @difficulty == "A" || @difficulty == "advanced" || @difficulty == "Advanced"
      @level = "advanced"
      @choice = "(r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, and (p)urple"
      @num = "eight"
      @size = 8
      @characters = ["r", "g", "b", "y", "w", "p"]
      randomfill
    elsif @difficulty == "q" || @difficulty == "quit" || @difficulty == "Q" || @difficulty == "Quit"
      puts "Quitting Now."
      exit
    else
      puts "Invalid Choice:"
      @valid_difficulty = false
    end
  end

  def difficulty_display
    puts "I have generated a #{@level} sequence with #{@num} elements made up of:"
    puts "#{@choice}"
    puts "Use (q)uit at any time to end the game."
    puts "What's your guess?"
  end

  def randomfill
    @size.times do
      @code << @characters.sample
    end
    difficulty_display
  end
end
