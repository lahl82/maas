# frozen_string_literal: true

module Api
  module V1
    class Technician < ApplicationRecord
      has_many :availables, foreign_key: 'api_v1_technician_id'
      has_many :allocations, foreign_key: 'api_v1_technician_id'
    end
  end
end
