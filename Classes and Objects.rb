require 'minitest/autorun'

class Car
  attr_accessor :make, :model, :color

  def initialize(make, model, color)
    @make = make
    @model = model
    @color = color
  end

  def print_color
    puts "The color of the car is #{@color}."
  end
end

class TestCar < Minitest::Test
  def setup
    @car = Car.new("Toyota", "Camry", "Blue")
  end

  def test_print_color
    assert_output(/The color of the car is Blue\./) { @car.print_color }
  end
end