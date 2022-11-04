# frozen_string_literal: true
FactoryBot.define do
    factory :api_v1_technician, class: 'Api::V1::Technician' do
      name { Faker::Name.gender_neutral_first_name }
      color { Faker::Color.hex_color }
    end
  end  
