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
                        day_id: available.block.day.id,
                        block_hour: available.block.hour,
                        block_id: available.api_v1_block_id,
                        week_id: available.api_v1_week_id,
                        week_number: available.week.number,
                        technician_id: available.api_v1_technician_id,
                        contract_id: contract.id })
        end

        result
      end

      # Determina los Technicians que tienen horas disponibles registradas para un contrato y semana especifica
      def self.candidates(contract, week)
        tech_ids = Available.where(contract:, week:).distinct.pluck(:api_v1_technician_id)

        technicians = []

        tech_ids.each do |tech_id|
          technicians.push(Technician.find_by(id: tech_id))
        end

        technicians
      end
    end
  end
end
