require './lib/ingredient'
require './lib/pantry'

RSpec.describe Ingredient do
  let(:ingredient1) {described_class.new({name: "Cheese", unit: "oz", calories: 50})}

  describe 'Tests for ingredient' do
    it 'is an instance of Ingredient' do
      expect(ingredient1).to be_a Ingredient
    end

    it 'has a name' do
      expect(ingredient1.name).to eq("Cheese")
    end

    it 'has units' do
      expect(ingredient1.unit).to eq("oz")
    end

    it 'has calories' do
      expect(ingredient1.calories).to eq(50)
    end
  end
end
