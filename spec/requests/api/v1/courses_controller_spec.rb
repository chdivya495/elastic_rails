# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::CoursesController', type: :request do
  let(:user) { FactoryBot.create(:user, email: 'test@example.com', password: 'password') }
  let(:headers) do
    post '/api/v1/auth/login', params: { email: user.email, password: 'password' }
    token = JSON.parse(response.body)['token']
    { 'Authorization' => "Bearer #{token}", 'Content-Type' => 'application/json' }
  end

  describe 'GET /index' do
    it 'returns a list of courses' do
      course1 = FactoryBot.create(:course, name: ' Course 1')
      course2 = FactoryBot.create(:course, name: 'Course demo')
      get '/api/v1/courses', headers: headers
      expect(response).to have_http_status(:ok)
      courses = JSON.parse(response.body)
      expect(courses.length).to eq(2)
      expect(courses[0]['id']).to eq(course1.id)
      expect(courses[0]['name']).to eq(course1.name)
      expect(courses[1]['id']).to eq(course2.id)
      expect(courses[1]['name']).to eq(course2.name)
    end
  end

  describe 'POST #create' do
    it 'it will create courses' do
      category = FactoryBot.create(:category)
      course_params = {
        course: {
          name: 'MBA',
          state: 'active',
          category_id: category.id,
          courses_attributes: [
            { name: 'Mathematics', author: 'demo', state: 'active' },
            { name: 'Finance', author: 'demo1', state: 'active' }
          ]
        }
      }
      post '/api/v1/courses', headers: headers, params: course_params.to_json
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'PUT #update'
  it 'it will create courses' do
    category = FactoryBot.create(:category)
    course = FactoryBot.create(:course, name: ' Course 1')
    course_params = {
      course: {
        name: 'BCA',
        state: 'active',
        category_id: category.id,
        courses_attributes: [
          { name: 'Mathematics', author: 'demo', state: 'active' },
          { name: 'BI', author: 'demo1', state: 'active' }
        ]
      }
    }
    put "/api/v1/courses/#{course.id}", headers: headers, params: course_params.to_json
    expect(response).to have_http_status(:ok)
  end
end
