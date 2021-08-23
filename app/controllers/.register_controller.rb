class RegisterController < ApplicationController
  def index
    @user = User.order(id: :desc).all
  end

  def new
  end

  def create
    @user = User.new(user_params) #creates a new user model
    #user params: all the data from the register form are stored here

    if @user.save
      redirect_to [:login], notice: 'User created!'
    else
      render :index
    end
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password
    )
  end
end
