# frozen_string_literal: true

module Api
  module V1
    # class Technician < ApplicationRecord
    class Technician < ApplicationRecord
      has_many :availables, foreign_key: 'api_v1_technician_id'
      has_many :allocations, foreign_key: 'api_v1_technician_id'
      has_many :technician_associations, foreign_key: 'api_v1_technician_id'
      
      # Hash de disponibilidad de todos los Tecnicos para una semana y bloque
      def self.availability_per_block(wk_id, bk_id)
        result = []

        availables = Available.where(api_v1_week_id: wk_id, api_v1_block_id: bk_id)

        ct_id = availables&.first&.api_v1_contract_id

        techs_list = associated(ct_id)

        techs_list.each do |tech|
          found = availables.find { |a| a[:api_v1_technician_id] == tech.id }

          if found
            result.push({ available_id: found.id,
                          block_id: found.api_v1_block_id,
                          week_id: found.api_v1_week_id,
                          technician_id: found.api_v1_technician_id,
                          contract_id: found.api_v1_contract_id })
          else
            result.push({})
          end
        end

        result
      end

      # Hash de disponibilidad de Tecnico para una semana y dia
      def availability_per_day(wk_id, dy_id)
        result = []

        blocks = Day.find_by(id: dy_id).blocks.pluck(:id)

        availables = Available.where(api_v1_week_id: wk_id, technician: self, api_v1_block_id: blocks)

        availables.each do |available|
          result.push({ block_id: available.api_v1_block_id,
                        week_id: available.api_v1_week_id,
                        technician_id: available.api_v1_technician_id,
                        contract_id: available.api_v1_contract_id })
        end

        result
      end

      # Hash de disponibilidad de Tecnico para un contrato y semana dados
      def availability(ct_id, wk_id)
        result = []

        availables = Available.where(api_v1_contract_id: ct_id, api_v1_week_id: wk_id, technician: self)

        p availables.size

        availables.each do |available|
          result.push({ day_name: available.block.day.name,
                        day_id: available.block.day.id,
                        block_hour: available.block.hour,
                        block_id: available.api_v1_block_id,
                        week_id: available.api_v1_week_id,
                        week_number: available.week.number,
                        technician_id: available.api_v1_technician_id,
                        contract_id: available.api_v1_contract_id })
        end

        result
      end

      # Determina los Technicians que tienen horas disponibles registradas para un contrato y semana especifica
      def self.candidates(ct_id, wk_id)
        tech_ids = Available.where(api_v1_contract_id: ct_id, api_v1_week_id: wk_id).distinct.pluck(:api_v1_technician_id)

        Technician.where(id: tech_ids)
      end

      # Retorna los Technicians asociados a un contrato a traves de TechnicianAssociation
      def self.associated(ct_id)
        tech_ids = TechnicianAssociation.where(api_v1_contract_id: ct_id).pluck(:api_v1_technician_id)

        Technician.where(id: tech_ids)
      end
    end
  end
end
