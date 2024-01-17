require 'minitest/autorun'

class Fruit
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def print_name
    puts "The name of the fruit is #{@name}."
  end
end

class Apple < Fruit
end

class TestApple < Minitest::Test
  def setup
    @apple = Apple.new("Red Apple")
  end

  def test_print_name
    assert_output(/The name of the fruit is Red Apple\./) { @apple.print_name }
  end
end