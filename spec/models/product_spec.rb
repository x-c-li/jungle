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
      puts 'ERROR MESSAGE', @product.errors.full_messages
    end 

    it 'returns false if price is not there' do
      expect().to be true 
    end 
   
    it 'returns false if quantity is not there' do 
      expect().to be true 

    end 
   
    it 'returns false if category is not there' do 
      expect().to be true 

    end 

  end 
end 