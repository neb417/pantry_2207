require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'


RSpec.describe CookBook do
  let(:cookbook) {described_class.new}
  let(:recipe1) {Recipe.new("Mac and Cheese")}
  let(:recipe2) {Recipe.new("Cheese Burger")}
  let(:pantry) {Pantry.new}
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:ingredient3) {Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})}
  let(:ingredient4) {Ingredient.new({name: "Bun", unit: "g", calories: 75})}

  describe 'Tests for CookBook class' do
    it 'is an instance of CookBook' do
      expect(cookbook).to be_a(CookBook)
    end
    
    it 'recipes empty by default' do
      expect(cookbook.recipes).to eq([])
    end

    it 'can add recipes to CookBook' do
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)

      expect(cookbook.recipes).to eq([recipe1, recipe2])
    end

    it 'can list ingredients from recipe' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)

      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)

      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)

      expect(cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

    it 'can find the meal with the highest calories' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)

      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)
      
      cookbook.add_recipe(recipe1)
      cookbook.add_recipe(recipe2)

      expect(cookbook.highest_calorie_meal).to eq(recipe2)
    end
  end
end