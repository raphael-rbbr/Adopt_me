class UsersController < ApplicationController
  before_action :set_user
  def show
    @my_pets = @user.pets
    @adoptions = @user.adoptions
    authorize @user
  end

  private
  def set_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:id, :email, :first_name, :last_name, :zip_code, :house_number, :profile, :profile_photo)
  end
end
