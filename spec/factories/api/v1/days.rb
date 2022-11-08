# frozen_string_literal: true

FactoryBot.define do
  days = ['', 'lunes', 'martes', 'miercoles', 'jueves', 'viernes', 'sabado', 'domingo']

  factory :api_v1_day, class: 'Api::V1::Day' do
    contract factory: :api_v1_contract
    name { days[Faker::Number.unique.between(from: 1, to: 7)] }
  end
end
