require 'minitest/autorun'
require 'minitest/pride'
require './lib/win.rb'
require 'pry'

class WinTest < Minitest::Test

class Code
  attr_accessor :start,
                :guesses,
                :code,
                :info

  def initialize
    @start = 15
    @info = [["r", "g", "b", "y"],[1, 2]]
  end
end

  def test_it_exists
    code = Code.new
    win = Win.new(code)
    assert_instance_of Win, win
  end

  def test_it_formats
    code = Code.new
    win = Win.new(code)
    assert_equal ((Time.now.to_i - 15) / 60), win.mins
    assert_equal ((Time.now.to_i - 15) % 60), win.secs
  end

  def test_it_congratulates
    code = Code.new
    win = Win.new(code)
    assert_equal "rgby", win.code.join
    assert_equal 2, win.guesses.length
  end
end
