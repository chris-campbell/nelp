class StaticPagesController < ApplicationController
  def splash
    @places = Place.all
  end
end
