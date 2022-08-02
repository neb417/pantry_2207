class CookBook
  attr_reader :recipes
  
  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients_list = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
        ingredients_list << ingredient.name if !ingredients_list.include?(ingredient.name)
      end
    end
    ingredients_list
  end

  def highest_calorie_meal
    calorie_count = {}
    @recipes.each do |recipe|
      calorie_count[recipe] = recipe.total_calories
    end
    calorie_count.max_by{|recipe, calories| calories}.first
  end
end
