# frozen_string_literal: true

module Api
  module V1
    # class Technician < ApplicationRecord
    class Technician < ApplicationRecord
      has_many :availables, foreign_key: 'api_v1_technician_id'
      has_many :allocations, foreign_key: 'api_v1_technician_id'

      # Hash de disponibilidad de Tecnico para un contrato y semana dados
      def availability(contract, week)
        result = []

        availables = Available.where(contract:, week:, technician: self)

        p availables.size

        availables.each do |available|
          result.push({ day_name: available.block.day.name,
                        block_hour: available.block.hour,
                        week_id: available.api_v1_week_id,
                        block_id: available.api_v1_block_id,
                        technician_id: available.api_v1_technician_id})
        end

        result
      end
    end
  end
end
