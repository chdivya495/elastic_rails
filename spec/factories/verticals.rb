# frozen_string_literal: true

# spec/factories/verticals.rb

FactoryBot.define do
  factory :vertical do
    sequence(:name) { |n| "Vertical #{n}" }

    # Add other attributes and associations as needed
  end
end
