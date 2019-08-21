class StaticPagesController < ApplicationController
  def splash
    @places = Place.all
  end

  def profile
    @user = current_user
  end
end
