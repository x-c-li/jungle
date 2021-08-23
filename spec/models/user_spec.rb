require 'rails_helper'

# has_many :orders
# has_secure_password

# validates :first_name, presence: true
# validates :last_name, presence: true
# validates :email, presence: true
# validates :password_digest, presence: true

RSpec.describe User, type: :model do
  
  describe 'Validating Mandatory User Fields' do 
    it 'returns not valid when user is missing first_name' do
      @user = User.new(first_name: nil, last_name: 'doe', email:   'email@email.ca', password_digest: 'password') 
      expect(@user).to_not be_valid
    end 

    it 'returns not valid when user does not have a last name' do 
      @user = User.new(first_name: 'john', last_name: nil, email:   'email@email.ca', password_digest: 'password') 
      expect(@user).to_not be_valid
    end 
    it 'returns not valid when user does not have an email' do 
      @user = User.new(first_name: 'john', last_name: 'doe', email: nil, password_digest: 'password') 
      expect(@user).to_not be_valid
    end 
    it 'returns not valid when user does not have a password' do 
      @user = User.new(first_name: 'john', last_name: 'doe', email:   'email@email.ca', password_digest: nil) 
      expect(@user).to_not be_valid
    end 
  end 

  it 'returns not valid when password and password_confirmation do not match' do 
    @user = User.new(first_name: 'john', last_name: 'doe', email: 'email@email.ca', password_digest: 'password')
    @password_confirmation = 'pAssword'
    expect().to_not be_valid 
  end 

end
