# frozen_string_literal: true

FactoryBot.define do
  factory :api_v1_week, class: 'Api::V1::Week' do
    sequence(:number) { |n| n }
  end
end
