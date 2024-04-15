# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::CategoriesControllers', type: :request do
  let(:user) { FactoryBot.create(:user, email: 'test@example.com', password: 'password') }
  let(:headers) do
    post '/api/v1/auth/login', params: { email: user.email, password: 'password' }
    token = JSON.parse(response.body)['token']
    { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'returns a list of categories' do
      category1 = FactoryBot.create(:category, name: 'Category 1')
      category2 = FactoryBot.create(:category, name: 'Category demo')
      get '/api/v1/categories', headers: headers
      expect(response).to have_http_status(:ok)
      categories = JSON.parse(response.body)
      expect(categories.length).to eq(2)
      expect(categories[0]['id']).to eq(category1.id)
      expect(categories[0]['name']).to eq(category1.name)
      expect(categories[1]['id']).to eq(category2.id)
      expect(categories[1]['name']).to eq(category2.name)
    end
  end

  describe 'POST #create' do
    it 'it will create categories' do
      vertical = FactoryBot.create(:vertical)
      category_params = {
        category: {
          name: 'Bike',
          state: 'active',
          vertical_id: vertical.id,
          courses_attributes: [
            { name: 'Royal Enfield', author: 'demo', state: 'active' },
            { name: 'Activa', author: 'demo1', state: 'active' }
          ]
        }
      }
      post '/api/v1/categories', headers: headers, params: category_params.to_json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update' do
    it 'will update categories' do
      category = FactoryBot.create(:category, name: 'Category 1')
      vertical = FactoryBot.create(:vertical)
      category_params = {
        category: {
          name: 'Car',
          state: 'active',
          vertical_id: vertical.id,
          courses_attributes: [
            { name: 'Alto', author: 'demo', state: 'active' },
            { name: 'Xylo', author: 'demo1', state: 'active' }
          ]
        }
      }
      put "/api/v1/categories/#{category.id}", headers: headers, params: category_params.to_json
      expect(response).to have_http_status(:ok)
    end
  end
end
