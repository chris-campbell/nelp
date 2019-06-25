class PlacesController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create, :edit, :update, :destroy ]

  def index
    if params[:filter].nil?
      @place_list = Place.all
    else
      @place_list = Place.send(params[:filter].downcase)
    end
    @places = Place.paginate(page: params[:page], per_page: 10)
  end

  def new
    @place = Place.new
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
    if current_user
      @user = User.find(current_user.id)
    end
  end

  def edit
    @place = Place.find(params[:id])

    if @place.user != current_user
      return redirect_to root_path, status: :forbidden
    end
  end

  def create
    @place = current_user.places.create(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @place = Place.find(params[:id])
    if @place.user != current_user
      return redirect_to @place, status: :forbidden
    end

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])

    if @place.user != current_user
      return redirect_to @place, status: :forbidden
    end

    @place.destroy
    redirect_to root_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description, :range)
  end

  helper_method :dollar_range
  def dollar_range(num)
    ranges = { '1': '$', '2': '$$', '3': '$$$', '4': '$$$$'}
    return ranges[num]
  end

  helper_method :format_date
  def format_date(date)
    formatted = date.strftime('%b %e, %l:%M %p')
    formatted
  end
end
