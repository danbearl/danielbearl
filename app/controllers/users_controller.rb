class UsersController < ApplicationController
  expose(:user)
  expose(:created_user) { User.new(user_params) }

  def create
    if created_user.save
      redirect_to root_path, notice: "User successfully created."
    else
      render :new
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
