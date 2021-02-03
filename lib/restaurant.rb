class Restaurant
    attr_reader :opening_time,
                :name,
                :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name         = name
    @dishes       = []
  end

  def closing_time(hours)
    "#{@opening_time.to_i + hours}:00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
   @opening_time.to_i < 12
  end

  def menu_dish_names
    excited_dishes = []
      @dishes.each do |dish|
      excited_dishes << dish.upcase
      end
    excited_dishes
  end
end
