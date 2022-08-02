require './lib/ingredient'
require './lib/pantry'
require './lib/recipe'
require 'pry'


RSpec.describe Pantry do
  let(:pantry) {described_class.new}
  let(:ingredient1) {Ingredient.new({name: "Cheese", unit: "oz", calories: 50})}
  let(:ingredient2) {Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})}
  let(:recipe1) {Recipe.new("Mac and Cheese")}
  let(:recipe2) {Recipe.new("Cheese Burger")}

  describe 'Tests for Pantry Class' do 
    it 'is and instance of Pantry' do
      expect(pantry).to be_a(Pantry)
    end

    it 'pantry is empty by default' do
      expect(pantry.stock).to eq({})
    end

    it 'pantry does not stock items by default' do
      expect(pantry.stock_check(ingredient1)).to eq(0)
    end

    it 'pantry can be restocked' do
      pantry.restock(ingredient1, 5)
      pantry.restock(ingredient1, 10)
      expect(pantry.stock_check(ingredient1)).to eq(15)

      pantry.restock(ingredient2, 7)
      expect(pantry.stock_check(ingredient2)).to eq(7)
    end

    it 'can check for enough ingredients in pantry' do
      pantry.restock(ingredient1, 5)
      pantry.restock(ingredient1, 10)

      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)

      expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)

      pantry.restock(ingredient2, 7)
      expect(pantry.enough_ingredients_for?(recipe1)).to eq(false)

      pantry.restock(ingredient2, 1)
      expect(pantry.enough_ingredients_for?(recipe1)).to eq(true)
    end
  end
end