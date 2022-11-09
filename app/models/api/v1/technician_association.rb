# frozen_string_literal: true

module Api
  module V1
    class TechnicianAssociation < ApplicationRecord
      belongs_to :contract, foreign_key: 'api_v1_contract_id'
      belongs_to :technician, foreign_key: 'api_v1_technician_id'
    end
  end
end
