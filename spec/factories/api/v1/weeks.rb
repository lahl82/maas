# frozen_string_literal: true
FactoryBot.define do
    factory :api_v1_week, class: 'Api::V1::Week' do
      number { Faker::Number.unique.between(from: 1, to: 52) }
    end
  end  
