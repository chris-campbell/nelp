require 'rails_helper'

RSpec.describe PlacesController, type: :controller do
  describe 'places#index' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'places#new' do
    it 'should successfully show the new form' do
      user = FactoryBot.create(:user)
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end
end
