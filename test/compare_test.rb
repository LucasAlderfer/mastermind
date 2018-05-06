require 'minitest/autorun'
require 'minitest/pride'
require './lib/compare.rb'

class CompareTest < Minitest::Test

class CodeB
  attr_accessor :code,
                :characters,
                :start

  def initialize
    @code = ["r", "g", "b", "y"]
    @characters = ["r", "g", "b", "y"]
    @start = 15
  end
end
codeb = CodeB.new

class CodeI
  attr_accessor :code,
                :characters,
                :start

  def initialize
    @code = ["r", "g", "b", "y", "w", "r"]
    @characters = ["r", "g", "b", "y", "w"]
    @start = 15
  end
end
codei = CodeI.new

class CodeA
  attr_accessor :code,
                :characters,
                :start

  def initialize
    @code = ["r", "g", "b", "y", "w", "p", "r", "g"]
    @characters = ["r", "g", "b", "y", "w", "p"]
    @start = 15
  end
end
codea = CodeA.new

class Guesses
  attr_accessor :guesses

  def initialize
    @guesses = [1, 2]
  end
end
guesses = Guesses.new

  def test_it_exists
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    compare_b = Compare.new("rgby", codeb, guesses)
    assert_instance_of Compare, compare_b
    compare_i = Compare.new("rgbyw", codei, guesses)
    assert_instance_of Compare, compare_i
    compare_a = Compare.new("rgbywp", codea, guesses)
    assert_instance_of Compare, compare_a
  end

  def test_it_can_check_for_quit_or_cheat
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    compare_cb = Compare.new("c", codeb, guesses)
    assert_equal true, compare_cb.cheat
    compare_ci = Compare.new("c", codei, guesses)
    assert_equal true, compare_ci.cheat
    compare_ca = Compare.new("c", codea, guesses)
    assert_equal true, compare_ca.cheat
  end

  def test_it_can_check_for_invalid_characters
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    compare_invalidb = Compare.new("!", codeb, guesses)
    assert_equal true, compare_invalidb.invalid_character
    compare_invalidi = Compare.new("!", codei, guesses)
    assert_equal true, compare_invalidi.invalid_character
    compare_invalida = Compare.new("!", codea, guesses)
    assert_equal true, compare_invalida.invalid_character
  end

  def test_it_can_check_for_invalid_length
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    compare_invalidlbl = Compare.new("rgbyr", codeb, guesses)
    assert_equal true, compare_invalidlbl.invalid_length
    compare_invalidlbs = Compare.new("rgb", codeb, guesses)
    assert_equal true, compare_invalidlbs.invalid_length
    compare_invalidlil = Compare.new("rgbyrgb", codei, guesses)
    assert_equal true, compare_invalidlil.invalid_length
    compare_invalidlis = Compare.new("rgbyr", codei, guesses)
    assert_equal true, compare_invalidlis.invalid_length
    compare_invalidlal = Compare.new("rgbyrgbyr", codea, guesses)
    assert_equal true, compare_invalidlal.invalid_length
    compare_invalidlas = Compare.new("rgbyrgb", codea, guesses)
    assert_equal true, compare_invalidlas.invalid_length
  end

  def test_it_can_check_for_correct_elements
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    compare_includeb = Compare.new("rggb", codeb, guesses)
    assert_equal 3, compare_includeb.correct_elements
    compare_includei = Compare.new("rgbyrg", codei, guesses)
    assert_equal 5, compare_includei.correct_elements
    compare_includea = Compare.new("rgbyrgby", codea, guesses)
    assert_equal 6, compare_includea.correct_elements
  end

  def test_it_can_check_for_correct_position
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    compare_positionb = Compare.new("rggb", codeb, guesses)
    assert_equal 2, compare_positionb.correct_position
    compare_positioni = Compare.new("rgbyrg", codei, guesses)
    assert_equal 4, compare_positioni.correct_position
    compare_positiona = Compare.new("rgbyrgby", codea, guesses)
    assert_equal 4, compare_positiona.correct_position
  end

  def test_it_can_check_for_correct_guess
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    correct_guessb = Compare.new("rgby", codeb, guesses)
    assert_equal true, correct_guessb.right_guess
    correct_guessi = Compare.new("rgbywr", codei, guesses)
    assert_equal true, correct_guessi.right_guess
    correct_guessa = Compare.new("rgbywprg", codea, guesses)
    assert_equal true, correct_guessa.right_guess
  end

  def test_it_can_handle_wrong_guesses
    codeb = CodeB.new
    codei = CodeI.new
    codea = CodeA.new
    guesses = Guesses.new
    wrong_guessb = Compare.new("rrrr", codeb, guesses)
    assert_equal "guesses", wrong_guessb.plural
    assert_equal "rrrr", wrong_guessb.try.join
    assert_equal 3, wrong_guessb.guess_num.length
    wrong_guessi = Compare.new("rrrrrr", codei, guesses)
    assert_equal "guesses", wrong_guessi.plural
    assert_equal "rrrrrr", wrong_guessi.try.join
    assert_equal 4, wrong_guessi.guess_num.length
    wrong_guessa = Compare.new("rrrrrrrr", codea, guesses)
    assert_equal "guesses", wrong_guessa.plural
    assert_equal "rrrrrrrr", wrong_guessa.try.join
    assert_equal 5, wrong_guessa.guess_num.length
  end
end
