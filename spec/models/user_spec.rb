require 'rails_helper'

# has_many :orders
# has_secure_password

# validates :first_name, presence: true
# validates :last_name, presence: true
# validates :email, presence: true
# validates :password_digest, presence: true

RSpec.describe UserSpec, type: :model do
  it 'returns not valid when user is missing first_name'
  it 'returns not valid when user does not have a last name' do 
  end 
  it 'returns not valid when user does not have an email' do 
  end 
  it 'returns not valid when user does not have a password' do 
  end 


  it 'returns not valid when password and password_confirmation do not match' do 
    @user = User.new(first_name: 'john', last_name: 'doe', email: 'email@email.ca', password_digest: 'password')
    @password_confirmation = 'pAssword'
    expect
  end 

end
