require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do
  describe 'static_pages#splash' do
    it 'should successfully load splash page' do
      get :splash
      expect(response).to have_http_status(:success)
    end
  end
end
