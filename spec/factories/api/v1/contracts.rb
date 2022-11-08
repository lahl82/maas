# frozen_string_literal: true

FactoryBot.define do
  factory :api_v1_contract, class: 'Api::V1::Contract' do
    name { Faker::Company.name }
    status { Faker::Boolean.boolean }
  end
end
