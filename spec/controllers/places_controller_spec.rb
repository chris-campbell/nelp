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

  describe 'places#create' do
    it 'should successfully create a new place in database' do
      user = FactoryBot.create(:user)
      sign_in user

      post :create, params: { place: {
                                name: 'Chris',
                                description: 'body of the full text',
                                address: '1234 fake street',
                                user_id: user.id,
                                latitude: 39.852840,
                                longitude: 116.801764,
                                range: '4'
                              }
                            }
      expect(response).to redirect_to root_path
      place = Place.last
      expect(place.address).to eq('1234 fake street')
      expect(place.user).to eq(user)
    end

    it "should properly deal with validation errors" do
     user = FactoryBot.create(:user)
     sign_in user

     place_count = Place.count
     post :create, params: { place: {
                               name: '',
                               description: '',
                               address: '',
                               user_id: user.id,
                               latitude: 39.852840,
                               longitude: 116.801764,
                               range: '4'
                             }
                           }
     expect(response).to have_http_status(:unprocessable_entity)
     expect(place_count).to eq Place.count
   end

  end

end
