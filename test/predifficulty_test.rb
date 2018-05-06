require 'minitest/autorun'
require 'minitest/pride'
require './lib/predifficulty.rb'

class PreDifficultyTest < Minitest::Test

  def test_it_exists
    pred = PreDifficulty.new
    assert_instance_of PreDifficulty, pred
  end
end
