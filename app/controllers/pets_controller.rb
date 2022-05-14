class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :destroy]

  def index
    @pets = policy_scope(Pet).order(created_at: :desc)
    authorize @pets
  end

  def show
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.user = current_user
    authorize @pet
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
  end

  def destroy
    set_pet
    @pet.destroy
    redirect_to pets_path
    authorize @pet
  end


  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :vaccinated, :description, :age, photos: [])
  end
end
