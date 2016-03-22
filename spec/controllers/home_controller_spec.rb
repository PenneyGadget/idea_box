require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  describe 'GET#index' do
    it 'responds with a 200 OK' do
      get :index

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end
  end
end
