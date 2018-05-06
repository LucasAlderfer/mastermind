require './lib/compare.rb'
require './lib/difficulty.rb'
require './lib/win.rb'
 
class GuessCount
  attr_accessor :guesses

  def initialize
    @guesses = []
  end
end
