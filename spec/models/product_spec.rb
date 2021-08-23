require 'rails_helper'

RSpec.describe Product, type: :model do 
    
  describe 'Validations' do 

    it 'should save if has all four' do 
      @category = Category.new(name: 'shoes')
      @product = Product.new(name: 'product name', price: 123, quantity: 111, category: @category) 
      expect(@product).to be_valid
    end 


    it 'show not valid if product doesn\t have a name' do
      @category = Category.new(name: 'Book')
      @product = Product.new(name: nil, price: 123, quantity: 111, category: @category)
      expect(@product).to_not be_valid
      # puts 'ERROR MESSAGE', @product.errors.full_messages
    end 

    it 'shows not valid if product price is nil' do
      @category = Category.new(name: 'Book')
      @product = Product.new(name: 'name', quantity: 111, category: @category)
      expect(@product).to_not be_valid
    end 
   
    it 'shows not valid if product quantity is nil' do 
      @category = Category.new(name: 'Book')
      @product = Product.new(name: 'name', price: 123, quantity: nil, category: @category)
      expect(@product).to_not be_valid
    end 
   
    it 'shows not valid if product category is nil' do 
      @category = Category.new(name: 'Book')
      @product = Product.new(name: 'name', price: 123, quantity: 111, category: nil)
      expect(@product).to_not be_valid
    end 

  end 
end 