require 'pry'
class Pantry
  attr_reader :stock

  def initialize
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
      @stock[ingredient] += quantity
  end
  
  def enough_ingredients_for?(recipe)
    recipe.ingredients_required.each do |ingredient, quantity|
      if stock_check(ingredient) >= quantity
        true
      else
        return false
      end
    end
    true
  end
end
