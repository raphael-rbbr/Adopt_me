class UsersController < ApplicationController
  before_action :set_user
  def show
    @user = current_user
    authorize @user
  end

  def my_pets
    @my_pets = @user.pets
    authorize @my_pets
  end

  private

  def set_user
    @user = current_user

  end

  def user_params
    params.require(:user).permit(:id,:first_name, :zip_code)
  end

end
