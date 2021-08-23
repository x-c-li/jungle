class User < ActiveRecord::Base
  has_many :orders
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, {presence: true, uniqueness: {case_sensitive: false }}

  validates :password, {presence: true, confirmation: true, length: {in: 6..20}}   
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials (email, password) 
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user 
    else 
      nil
    end 
  end 

end
