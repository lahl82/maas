# frozen_string_literal: true

module Api
  module V1
    class Contract < ApplicationRecord
      has_many :days, foreign_key: 'api_v1_contract_id'
      has_many :availables, foreign_key: 'api_v1_contract_id'

      def hash_contract_with_blocks
        result = []
        p days.size
        days.each do |day|
          day.blocks.each do |block|
            result.push({ day_name: day.name, block_hour: block.hour, block_id: block.id })
          end
        end

        result
      end
    end
  end
end
