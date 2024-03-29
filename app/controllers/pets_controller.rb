class PetsController < ApplicationController
  before_action :set_pet, only: [ :show, :destroy ]

  def index
    @pets = policy_scope(Pet).order(created_at: :desc)
    authorize @pets

    if params[:query].present?
      @pets = Pet.search_by_address(params[:query])
    end

    @markers = @pets.geocoded.map do |pet|
      {
        lat: pet.latitude,
        lng: pet.longitude,
        info_window: render_to_string(partial: "info_window", locals: { pet: pet })
        # image_url: helpers.asset_url("REPLACE_THIS_WITH_YOUR_IMAGE_IN_ASSETS")
      }
    end
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
    @pet.save
    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end
    authorize @pet
  end

  def edit
    @pet = Pet.find(params[:id])
    authorize @pet
  end

  def update
    @pet = Pet.find(params[:id])
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
    authorize @pet
  end

  def pet_adopted
    @pet = Pet.find(params[:id])
    @pet.status = "adopted"
    @pet.save
    redirect_to pets_path
    authorize @pet
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
    params.require(:pet).permit(:name, :address, :species, :vaccinated, :description, :age, :history, :castrated, photos: [])
  end
end
