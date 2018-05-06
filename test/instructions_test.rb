require 'minitest/autorun'
require 'minitest/pride'
require './lib/instructions.rb'

class InstructionsTest < Minitest::Test

  def test_it_exists
    instructions = Instructions.new
    assert_instance_of Instructions, instructions
  end
end
