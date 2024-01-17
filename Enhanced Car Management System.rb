require 'minitest/autorun'

class Car
  attr_accessor :make, :model, :color

  def initialize(make, model, color)
    @make = make
    @model = model
    @color = color
  end

  def info
    "Make: #{@make}, Model: #{@model}, Color: #{@color}"
  end
end

class Garage
  attr_accessor :cars

  def initialize
    @cars = []
  end

  def add_car(car)
    @cars << car
  end

  def remove_car_by_make_and_model(make, model)
    @cars.reject! { |car| car.make == make && car.model == model }
  end

  def list_all_cars
    @cars.map(&:info)
  end

  def find_cars_by_color(color)
    @cars.select { |car| car.color == color }.map(&:info)
  end

  def clear_garage
    @cars = []
  end
end

class TestCarAndGarage < Minitest::Test
  def test_car_attributes
    car = Car.new("Toyota", "Camry", "Blue")
    assert_equal "Toyota", car.make
    assert_equal "Camry", car.model
    assert_equal "Blue", car.color
  end

  def test_car_info_method
    car = Car.new("Toyota", "Camry", "Blue")
    assert_equal "Make: Toyota, Model: Camry, Color: Blue", car.info
  end

  def test_garage_add_car
    garage = Garage.new
    car = Car.new("Toyota", "Camry", "Blue")
    garage.add_car(car)
    assert_equal [car], garage.cars
  end

  def test_garage_remove_car_by_make_and_model
    garage = Garage.new
    car1 = Car.new("Toyota", "Camry", "Blue")
    car2 = Car.new("Honda", "Civic", "Red")
    garage.add_car(car1)
    garage.add_car(car2)
    garage.remove_car_by_make_and_model("Toyota", "Camry")
    assert_equal [car2], garage.cars
  end

  def test_garage_list_all_cars
    garage = Garage.new
    car1 = Car.new("Toyota", "Camry", "Blue")
    car2 = Car.new("Honda", "Civic", "Red")
    garage.add_car(car1)
    garage.add_car(car2)
    assert_equal ["Make: Toyota, Model: Camry, Color: Blue", "Make: Honda, Model: Civic, Color: Red"], garage.list_all_cars
  end

  def test_garage_find_cars_by_color
    garage = Garage.new
    car1 = Car.new("Toyota", "Camry", "Blue")
    car2 = Car.new("Honda", "Civic", "Red")
    garage.add_car(car1)
    garage.add_car(car2)
    assert_equal ["Make: Toyota, Model: Camry, Color: Blue"], garage.find_cars_by_color("Blue")
  end

  def test_garage_clear_garage
    garage = Garage.new
    car1 = Car.new("Toyota", "Camry", "Blue")
    car2 = Car.new("Honda", "Civic", "Red")
    garage.add_car(car1)
    garage.add_car(car2)
    garage.clear_garage
    assert_equal [], garage.cars
  end
end