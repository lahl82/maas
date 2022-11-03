# frozen_string_literal: true

module Api
  module V1
    class Week < ApplicationRecord
      has_many :availables, foreign_key: 'api_v1_week_id'
      has_many :allocations, foreign_key: 'api_v1_week_id'
    end
  end
end
