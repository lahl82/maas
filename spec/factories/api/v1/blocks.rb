# frozen_string_literal: true
FactoryBot.define do
    factory :api_v1_block, class: 'Api::V1::Block' do
      day factory: :api_v1_day
      hour { Faker::Number.unique.between(from: 18, to: 23) }
    end
  end
  