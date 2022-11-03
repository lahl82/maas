# frozen_string_literal: true

module Api
  module V1
    class Block < ApplicationRecord
      belongs_to :day, foreign_key: 'api_v1_day_id'
      has_many :availables, foreign_key: 'api_v1_block_id'
      has_many :allocations, foreign_key: 'api_v1_block_id'
    end
  end
end
