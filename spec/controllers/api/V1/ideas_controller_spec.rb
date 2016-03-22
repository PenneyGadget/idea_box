require 'rails_helper'

RSpec.describe Api::V1::IdeasController, type: :controller do
  describe 'GET#index' do
    let(:json_response) { JSON.parse(response.body, symbolize_name: true) }

    it 'responds with a 200 OK' do
      get :index, format: :json

      expect(response.status).to eq(200)
      expect(response).to be_successful
    end

    it 'responds with proper information' do
      ideas = create_list(:idea, 3)
      get :index, format: :json

      expect(ideas.last[:id]).to eq(ideas.last.id)

      expect(ideas.first[:title]).to eq(ideas.first.title)
      expect(ideas.first[:title]).to eq("Title 1")

      expect(ideas.last[:body]).to eq(ideas.last.body)
      expect(ideas.last[:body]).to eq("Body 3")

      expect(ideas.first[:quality]).to eq(ideas.first.quality)
      expect(ideas.last[:quality]).to eq(0)
    end
  end

  describe 'POST#create' do
    it 'is responds with a 201 OK' do
      post :create, format: :json, idea: { title: "Idea!",
                                           body: "Yay!" }

      expect(response.status).to eq(201)
      expect(response).to be_successful
    end

    it 'creates the idea correctly' do
      post :create, format: :json, idea: { title: "Idea!",
                                           body: "Yay!" }

      idea = Idea.last

      expect(idea.title).to eq("Idea!")
      expect(idea.body).to eq("Yay!")
      expect(idea.quality).to eq(0)
      expect(Idea.count).to eq(1)
    end
  end

  describe 'DELETE#destroy' do
    it 'responds with a 204' do
      idea = create(:idea)

      delete :destroy, format: :json, id: idea.id

      expect(response.status).to eq(204)
      expect(response).to be_successful
    end

    it 'successfully deletes the idea' do
      ideas = create_list(:idea, 2)
      expect(Idea.count).to eq(2)

      delete :destroy, format: :json, id: ideas.first.id

      expect(Idea.count).to eq(1)
    end
  end

  describe 'PUT#update' do
    xit 'responds with a 204' do

    end

    xit 'successfully updates the title and body of an idea' do

    end

    xit 'successfull updates the quality of an idea'
  end
end
