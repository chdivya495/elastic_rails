# frozen_string_literal: true

# spec/factories/courses.rb

FactoryBot.define do
  factory :course do
    name { 'Example Course' }
    author { 'John Doe' }
    state { 'active' }
    association :category
  end
end
