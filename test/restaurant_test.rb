require 'minitest/autorun'
require 'minitest/pride'
require './lib/restaurant'

class RestaurantTest < Minitest::Test
  # Iteration 1 Tests:
  def test_it_exists
    restaurant = Restaurant.new('10:00', 'Fuel Cafe')

    assert_instance_of Restaurant, restaurant
  end

  def test_it_has_opening_time

    restaurant = Restaurant.new('10:00', 'Fuel Cafe')

    assert_equal '10:00', restaurant.opening_time
  end

  def test_it_has_name

    restaurant = Restaurant.new('10:00', 'Fuel Cafe')

    assert_equal 'Fuel Cafe', restaurant.name
  end

  def test_it_has_dishes

    restaurant = Restaurant.new('10:00', 'Fuel Cafe')

    assert_equal [], restaurant.dishes
  end

  #Iteration 2 Tests:
  def test_it_has_closing_time

    restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
    restaurant2 = Restaurant.new('16:00', 'Il Poggio')

    assert_equal '18:00', restaurant1.closing_time(8)
    assert_equal '23:00', restaurant2.closing_time(7)
  end

  def test_it_can_add_dishes

    restaurant = Restaurant.new('16:00', 'Il Poggio')

    restaurant.add_dish('Burrata')
    restaurant.add_dish('Pizzetta')
    restaurant.add_dish('Ravioli')

    assert_equal ['Burrata', 'Pizzetta', 'Ravioli'], restaurant.dishes
  end


#Iteration3
  def test_it_is_open_for_lunch
    restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
    restaurant2 = Restaurant.new('16:00', 'Il Posto')
    assert_equal true,  restaurant1.open_for_lunch?
    assert_equal false, restaurant2.open_for_lunch?
  end

  def test_it_has_menu_dishes_excited
    restaurant1 = Restaurant.new('10:00', 'Fuel Cafe')
    restaurant2 = Restaurant.new('16:00', 'Il Posto')
    restaurant2.add_dish('Burrata')
    restaurant2.add_dish('Pizzetta')
    restaurant2.add_dish('Ravioli')

    expected = ["BURRATA", "PIZZETTA", "RAVIOLI"]

    assert_equal expected, restaurant2.menu_dish_names
  end

#Iteration4
  def test_it_can_announce_closing_time
    restaurant1 = Restaurant.new('6:00', 'Fuel Cafe')
    restaurant2 = Restaurant.new('16:00', 'Il Posto')
    restaurant3 = Restaurant.new('5:00', 'Sherrys Tasty Desserts')

    expected1 = "Fuel Cafe will be closing at 11:00AM"
    assert_equal expected1 , restaurant1.announce_closing_time(5)

    expected2 = "Il Posto will be closing at 11:00PM"
    assert_equal expected2, restaurant2.announce_closing_time(7)

    expected3 = "Sherrys Tasty Desserts will be closing at 3:00PM"
    assert_equal expected3, restaurant3.announce_closing_time(10)
  end

  #YAY, it didnt work the first time, im glad i was able to run another test with opening before lunch and closing later to double check.
end
