# frozen_string_literal: true
FactoryBot.define do
    factory :api_v1_available, class: 'Api::V1::Available' do
      block factory: :api_v1_block
      week factory: :api_v1_week
      technician factory: :api_v1_technician
    end
  end
  