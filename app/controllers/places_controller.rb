class PlacesController < ApplicationController
  before_action :authenticate_user!, only: %I[new create edit update destroy tally]

  def index
    @places = Place.all
  end

  def new
    @place = Place.new
  end

  def show
    @place = Place.find(params[:id])
    @comment = Comment.new
    @photo = Photo.new
    @user = User.find(current_user.id) if current_user
  end

  def edit
    @place = Place.find(params[:id]).to_i
    return redirect_to @place, status: :forbidden if @place.user != current_user
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
    return redirect_to @place, status: :forbidden if @place.user != current_user

    @place.update_attributes(place_params)
    if @place.valid?
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @place = Place.find(params[:id])
    return redirect_to @place, status: :forbidden if @place.user != current_user
    @place.destroy
    redirect_to root_path
  end

  def tally
    @place = Place.find(params[:place_id].to_i)
    if params[:user_response] == 'yes'
      if vote_exist?(@place, current_user.id)
        puts "Aleady Voted!"
      else
        @place.tally_up
        generate_vote(@place, current_user.id)
      end
    elsif params[:user_response] == 'no'
      if vote_exist?(@place, current_user.id)
        puts "Already voted"
      else
        @place.tally_down
        generate_vote(@place, current_user.id)
      end
    end
    broadcast_to_tally(@place)
  end

  private

  def place_params
    params.require(:place).permit(:name, :address, :description, :range)
  end

  helper_method :generate_vote
  def generate_vote(place, user_id)
    Vote.create!(voter_id: user_id, tally_id: place.tally.id)
  end

  helper_method :vote_exist?
  def vote_exist?(place, user_id)
    place.tally.votes.exists?(voter_id: user_id)
  end

  helper_method :score
  def score(tally_yes, score)
    (tally_yes / score * 100).to_i
  end

  helper_method :dollar_range
  def dollar_range(num)
    ranges = { '1' => '$', '2' => '$$', '3' => '$$$', '4' => '$$$$' }
    ranges[num]
  end

  helper_method :format_date
  def format_date(date)
    formatted = date.strftime('%b %e, %l:%M %p')
    formatted
  end

  helper_method :broadcast_to_tally
  def broadcast_to_tally(place)
    ActionCable.server.broadcast 'tally_channel',
                                 content: place.tally.percent,
                                 place_id: place.id
  end
end
