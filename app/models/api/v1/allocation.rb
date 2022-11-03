# frozen_string_literal: true

module Api
  module V1
    class Allocation < ApplicationRecord
      belongs_to :block, foreign_key: 'api_v1_block_id'
      belongs_to :week, foreign_key: 'api_v1_week_id'
      belongs_to :technician, foreign_key: 'api_v1_technician_id'
    end
  end
end
