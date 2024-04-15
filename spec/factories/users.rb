# frozen_string_literal: true

# spec/factories/users.rb

FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password' }
    username { 'abc' }
    # Add any other attributes as needed
  end
end
