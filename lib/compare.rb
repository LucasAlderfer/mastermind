require './lib/difficulty.rb'
require './lib/guess_count.rb'
require './lib/win.rb'
require 'pry'

class Compare
  attr_accessor :code,
                :characters,
                :guesses,
                :info,
                :correct_position,
                :correct_elements, #Only needs access for testing
                :plural, #Same as above
                :try, #Same as above
                :guess_num,
                :start,
                :cheat, #variable created and accessed for testing
                :invalid_character, #same as above
                :invalid_length, #"
                :right_guess #"

  def initialize(guess, code, guesses)
    @guess_num = guesses.guesses
    @sec_code = code.code
    @pos_characters = code.characters
    @guess = guess
    @try = guess.to_s.downcase.split('')
    @correct_elements = 0
    @correct_position = 0
    @info = [@sec_code, @guess_num]
    @start = code.start
    @cheat = nil #The below variables were created for testing
    @invalid_character = nil
    @invalid_length = nil
    @right_guess = nil
    @plural #only an instance variable for testing
    quit_or_cheat
  end

  def quit_or_cheat
    if @guess == "q" || @guess == "quit" || @guess == "Q" || @guess == "Quit"
      puts "Quitting Now."
      exit
    elsif @guess == "c" || @guess == "C" || @guess == "cheat" || @guess == "Cheat"
      puts "The answer is #{@sec_code.join}!"
      puts "You can either quit now or keep playing."
      @cheat = true
    else
      invalid
    end
  end

  def invalid
    invalid_count = 0
    @try.each do |x|
      s = 0
      @pos_characters.each do |y|
        if x != y
          s += 1
        end
      end
      if s == @pos_characters.length
        invalid_count += 1
      end
    end
    if invalid_count > 0
      puts "Invalid Character, please guess using any of the following characters:"
      puts "#{@pos_characters}"
      @invalid_character = true
    else
      valid_size
    end
  end

  def valid_size
    if @try.length > @sec_code.length
      print "User guess is too long, should be #{@sec_code.length} letters. Try Again. > "
      @invalid_length = true
    elsif @try.length < @sec_code.length
      print "User guess is too short, should be #{@sec_code.length} letters.  Try Again. > "
      @invalid_length = true
    else
      @guess_num << @guess
      compare_include
    end
  end

  def compare_include
    compare_code = @sec_code.clone
    @try.each_with_index do |each, index|
      iterating_index = 0
      if compare_code.include?(each)
        @correct_elements += 1
        until each == compare_code[iterating_index]
          iterating_index += 1
        end
        compare_code[iterating_index] = 0
      end
    end
    compare_index
  end

  def compare_index
    @try.each_with_index do |each, index|
      if each == @sec_code[index]
        @correct_position += 1
      end
    end
    right_guess
  end

  def right_guess
    if @correct_elements != @sec_code.length || @correct_position != @sec_code.length
      wrong_guess
    else
      @right_guess = true
    end
  end

  def wrong_guess
    if @guess_num.length == 1
      @plural = "guess"
    else
      @plural = "guesses"
    end
    puts "'#{@try.join}' has #{@correct_elements} of the correct elements with #{@correct_position} in the correct positions."
    puts "You've taken #{@guess_num.length} #{plural}."
    print "Guess Again: "
  end
end
