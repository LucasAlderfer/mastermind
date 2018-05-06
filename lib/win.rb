require './lib/difficulty.rb'
require './lib/guess_count.rb'
require './lib/compare.rb'

class Win
  attr_accessor :start,
                :guesses,
                :code,
                :info,
                :mins, #Added to get tests to work
                :secs #Added to get tests to work

  def initialize(code)
    @code = code.info[0]
    @guesses = code.info[1]
    @start_time = code.start
    @finish = Time.now
    @mins
    @secs
    time_format
  end

  def time_format
    x = @finish.to_i - @start_time.to_i
    @mins = x / 60
    @secs = x % 60
    congratulate
  end

  def congratulate
    puts "Congratulations! You guessed the sequence '#{@code.join}' in #{@guesses.length} guesses over #{@mins} minutes, #{@secs} seconds."
  end
end
