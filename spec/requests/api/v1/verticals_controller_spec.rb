# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::VerticalsController', type: :request do
  let(:user) { FactoryBot.create(:user, email: 'test@example.com', password: 'password') }
  let(:headers) do
    post '/api/v1/auth/login', params: { email: user.email, password: 'password' }
    token = JSON.parse(response.body)['token']
    { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'returns a list of verticals' do
      vertical1 = FactoryBot.create(:vertical, name: 'Vertical 1')
      vertical2 = FactoryBot.create(:vertical, name: 'Vertical demo')
      get '/api/v1/verticals', headers: headers
      expect(response).to have_http_status(:ok)
      verticals = JSON.parse(response.body)
      expect(verticals.length).to eq(2)
      expect(verticals[0]['id']).to eq(vertical1.id)
      expect(verticals[0]['name']).to eq(vertical1.name)
      expect(verticals[1]['id']).to eq(vertical2.id)
      expect(verticals[1]['name']).to eq(vertical2.name)
    end
  end

  describe 'POST #create' do
    it 'it will create verticals' do
      vertical_params = {
        vertical: {
          name: 'Technology',
          verticals_attributes: [
            { name: 'Software Development', state: 'active' },
            { name: 'Data Science', state: 'active' }
          ]
        }
      }
      post '/api/v1/verticals', headers: headers, params: vertical_params.to_json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update' do
    it 'will update categories' do
      vertical = FactoryBot.create(:vertical, name: 'Vertical 1')
      vertical_params = {
        vertical: {
          name: 'New Technology',
          verticals_attributes: [
            { name: 'BI', author: 'demo', state: 'active' },
            { name: 'Analytics', author: 'demo1', state: 'active' }
          ]
        }
      }
      put "/api/v1/verticals/#{vertical.id}", headers: headers, params: vertical_params.to_json
      expect(response).to have_http_status(:ok)
    end
  end
end
