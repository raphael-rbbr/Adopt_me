class AdoptionsController < ApplicationController
  before_action :set_adoption, except: [:new, :create]
  before_action :set_pet, except: [:destroy]
  before_action :set_user, except: [:new, :create]


  def new
    @adoption = Adoption.new
    authorize @adoption
    authorize @pet

  end

  def create
    @pet_id = @pet.id
    @user_id = current_user.id
    @adoption = Adoption.new(user_id: @user_id, pet_id: @pet_id)
    @adoption.save
    if @adoption.save
      redirect_to pets_path
    else
      redirect_to pets_path(@pet)
    end
    authorize @adoption
    authorize @pet
  end

  def destroy
    @adoption.destroy
    redirect_to pets_path
    authorize @adoption
  end

  private

  def adoption_params
    params.require(:adoption).permit(:pet_id, :user_id)
  end

  def set_adoption
    @adoption = Adoption.find(params[:id])
  end

  def set_pet
    @pet = Pet.find(params[:pet_id])
  end

  def set_user
    @user = current_user
  end
end
