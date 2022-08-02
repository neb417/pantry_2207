require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require './lib/cook_book'

RSpec.describe Recipe do
  let(:recipe1) {described_class.new("Mac and Cheese")}
  let(:recipe2) {described_class.new("Cheese Burger")}
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "C", calories: 100})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})}
  let(:ingredient3) {Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})}
  let(:ingredient4) {Ingredient.new({name: "Bun", unit: "g", calories: 75})}

  describe 'Test Recipe class' do
    it 'it is an instance of Recipe' do
      expect(recipe1).to be_a(Recipe)
    end

    it 'recipes have a name' do
      expect(recipe1.name).to eq("Mac and Cheese")
    end

    it 'recipe ingredients are blank to by default' do
      expect(recipe1.ingredients_required).to eq({})
    end

    it 'recipe take input to require ingredients' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient1, 4)
      recipe1.add_ingredient(ingredient2, 8)

      expected_hash = {ingredient1 => 6, ingredient2 => 8}

      expect(recipe1.ingredients_required).to eq(expected_hash)
    end

    it 'recipe has ingredients' do
      expect(recipe1.ingredients).to eq([])

      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient1, 4)
      recipe1.add_ingredient(ingredient2, 8)

      expect(recipe1.ingredients).to eq([ingredient1, ingredient2])
    end

    it 'can count total calories' do
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)

      recipe2.add_ingredient(ingredient1, 2)
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 1)

      expect(recipe1.total_calories).to eq(440)
      expect(recipe2.total_calories).to eq(675)
    end
  end
end