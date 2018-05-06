require 'minitest/autorun'
require 'minitest/pride'
require './lib/guess_count.rb'

class GuessCountTest < Minitest::Test

  def test_it_exists
    guess_count = GuessCount.new
    assert_instance_of GuessCount, guess_count
  end
end
