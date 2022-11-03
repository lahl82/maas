# frozen_string_literal: true

module Api
  module V1
    class Contract < ApplicationRecord
      has_many :days, foreign_key: 'api_v1_contract_id'
    end
  end
end
