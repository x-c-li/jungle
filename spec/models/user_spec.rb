require 'rails_helper'

# has_many :orders
# has_secure_password

# validates :first_name, presence: true
# validates :last_name, presence: true
# validates :email, presence: true
# validates :password, presence: true

RSpec.describe User, type: :model do
  
  describe 'Validating Mandatory User Fields' do 
    it 'returns not valid when user is missing first_name' do
      @user = User.new(first_name: nil, last_name: 'doe', email:   'email@email.ca', password: 'password', password_confirmation: 'password') 
      
      expect(@user).to_not be_valid
    end 

    it 'returns not valid when user does not have a last name' do 
      @user = User.new(first_name: 'john', last_name: nil, email: 'email@email.ca', password: 'password', password_confirmation: 'password') 
      
      expect(@user).to_not be_valid
    end 
    it 'returns not valid when user does not have an email' do 
      @user = User.new(first_name: 'john', last_name: 'doe', email: nil, password: 'password', password_confirmation: 'password') 
      
      expect(@user).to_not be_valid
    end 

    it 'returns not valid when user does not have a password' do 
      @user = User.new(first_name: 'john', last_name: 'doe', email:   'email@email.ca', password: nil) 
      
      expect(@user).to_not be_valid
    end 
  end 

  it 'returns not valid when password and password_confirmation do not match' do 
    @user = User.new(first_name: 'john', last_name: 'doe', email: 'email@email.ca', password: 'password', password_confirmation: 'asdfasdf')
    expect(@user).to_not be_valid 
    # puts 'ERROR MESSAGE', @user.errors.full_messages
  end 

  describe 'Password Minimum Length' do 
    it 'returns not valid when password length is shorter than 8 chars' do
      @password = 'passw' 
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'email@email.ca', password: @password, password_confirmation: 'passw')
      expect(@user).to_not be_valid
    end 
  end 

  describe '.authenticate_with_credentials' do
    it 'it should not authenticate if email and password do not match' do 
      @password = 'password'
      @email = 'email@email.ca'
      @user = User.new(first_name: 'john', last_name: 'doe', email: @email, password: @password, password_confirmation: 'password')
      @result = User.authenticate_with_credentials(@email, 'psswrd')
      expect(@result).to eql(nil)
    end
    
    it 'it should not be nil if email has extra spaces at the start' do 
      @password = 'password'
      @email = '   email@email.ca'
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'email@email.ca', password: @password, password_confirmation: @password)
      @user.save
      @result = User.authenticate_with_credentials(@email, @password)
      expect(@result).to_not eql(nil)
    end
    
    it 'it should not be nil if email has weird cases' do 
      @password = 'password'
      @email = 'eMaIl@email.ca'
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'email@email.ca', password: @password, password_confirmation: @password)
      @user.save
      @result = User.authenticate_with_credentials(@email, @password)
      expect(@result).to_not eql(nil)
    end
    

  end
end
