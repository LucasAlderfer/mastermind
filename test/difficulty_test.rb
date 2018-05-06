require 'minitest/autorun'
require 'minitest/pride'
require './lib/difficulty.rb'

class DifficultyTest < Minitest::Test

  def test_it_exists
    difficulty = Difficulty.new("x")
    assert_instance_of Difficulty, difficulty
  end

  def test_it_sets_difficulty
    difficulty_b = Difficulty.new("b")
    assert_equal "beginner", difficulty_b.level
    assert_equal "(r)ed, (g)reen, (b)lue, and (y)ellow", difficulty_b.choice
    assert_equal "four", difficulty_b.num
    assert_equal 4, difficulty_b.size
    assert_equal ["r", "g", "b", "y"], difficulty_b.characters
    difficulty_i = Difficulty.new("i")
    assert_equal "intermediate", difficulty_i.level
    assert_equal "(r)ed, (g)reen, (b)lue, (y)ellow, and (w)hite", difficulty_i.choice
    assert_equal "six", difficulty_i.num
    assert_equal 6, difficulty_i.size
    assert_equal ["r", "g", "b", "y", "w"], difficulty_i.characters
    difficulty_a = Difficulty.new("a")
    assert_equal "advanced", difficulty_a.level
    assert_equal "(r)ed, (g)reen, (b)lue, (y)ellow, (w)hite, and (p)urple", difficulty_a.choice
    assert_equal "eight", difficulty_a.num
    assert_equal 8, difficulty_a.size
    assert_equal ["r", "g", "b", "y", "w", "p"], difficulty_a.characters
    difficulty_e = Difficulty.new("e")
    assert_equal false, difficulty_e.valid_difficulty
  end

  def test_it_makes_a_code
    difficulty_b = Difficulty.new("b")
    assert_equal 4, difficulty_b.code.length
    difficulty_i = Difficulty.new("i")
    assert_equal 6, difficulty_i.code.length
    difficulty_a = Difficulty.new("a")
    assert_equal 8, difficulty_a.code.length
    difficulty_e = Difficulty.new("e")
    assert_equal 0, difficulty_e.code.length
  end
end
