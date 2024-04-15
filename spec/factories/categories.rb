# frozen_string_literal: true

# spec/factories/categories.rb

FactoryBot.define do
  factory :category do
    sequence(:name) { |n| "Category #{n}" }
    state { 'active' }
    association :vertical, factory: :vertical

    # Ensure that the vertical_id is present to satisfy the foreign key constraint
    vertical_id { create(:vertical).id }

    # If you have a courses association, you can define them here as well
    # For example:
    # after(:create) do |category|
    #   create_list(:course, 3, category: category)
    # end
  end
end
