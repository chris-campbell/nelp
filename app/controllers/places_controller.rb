class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update ]

  def index
    @places = Place.paginate(:page => params[:page], :per_page => 10)
  end
  
  def new
    @place = Place.new
  end
  
  def show
    @place = Place.find(params[:id])
  end
  
  def edit
    @place = Place.find(params[:id])
    
    if @place.user != current_user
      return redirect_to root_path, status: :forbidden
    end
  end
  
  def create
    current_user.places.create(place_params)
    redirect_to root_path
  end
  
  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return redirect_to @place, status: :forbidden
    end
    
    @place.update_attributes(place_params)
    redirect_to root_path
  end
  
  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to root_path
  end
  
  
  private 
  
    def place_params
      params.require(:place).permit(:name, :address, :description)
    end
end
