# frozen_string_literal: true

module Api
  module V1
    class Day < ApplicationRecord
      belongs_to :contract, foreign_key: 'api_v1_contract_id'
      # belongs_to :contract
      has_many :blocks, foreign_key: 'api_v1_day_id'
    end
  end
end
