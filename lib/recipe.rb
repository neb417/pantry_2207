class Recipe
  attr_reader :name, :ingredients_required, :ingredients

  def initialize(name)
    @name = name
    @ingredients_required = Hash.new(0)
    @ingredients = []
  end

  def add_ingredient(ingredient, quantity)
    @ingredients_required[ingredient] += quantity
    @ingredients << ingredient if !@ingredients.include?(ingredient)
  end

  def total_calories
    calories = @ingredients_required.map do |ingredient, quantity|
      ingredient.calories * quantity
    end
    calories.sum
  end
end
