require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # Create a category object to associate with the product
    before(:each) do
      @category = Category.create(name: 'Tropical')
    end

    it 'should save a product with all fields set' do
      product = Product.new(name: 'Aglaonema', price: 550, quantity: 3, category: @category)
      expect(product).to be_valid
    end

    it 'should not save a product without a name' do
      product = Product.new(name: nil, price: 550, quantity: 3, category: @category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save a product without a price' do
      product = Product.new(name: 'Aglaonema', price_cents: nil, quantity: 3, category: @category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should not save a product without a quantity' do
      product = Product.new(name: 'Aglaonema', price: 550, quantity: nil, category: @category)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save a product without a category' do
      product = Product.new(name: 'Aglaonema', price: 550, quantity: 3, category: nil)
      expect(product).not_to be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")

    end
  end
end