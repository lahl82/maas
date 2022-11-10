# frozen_string_literal: true

module Api
  module V1
    # class Allocation < ApplicationRecord
    class Allocation < ApplicationRecord
      belongs_to :block, foreign_key: 'api_v1_block_id'
      belongs_to :week, foreign_key: 'api_v1_week_id'
      belongs_to :technician, foreign_key: 'api_v1_technician_id'
      belongs_to :contract, foreign_key: 'api_v1_contract_id'
      
      # Hash de asignaciones de todos los Tecnicos para una semana y bloque
      def self.allocation_per_block(wk_id, bk_id)
        result = []

        allocations = Allocation.where(api_v1_week_id: wk_id, api_v1_block_id: bk_id)

        ct_id = allocations&.first&.api_v1_contract_id

        techs_list = Technician.associated(ct_id)

        techs_list.each do |tech|
          found = allocations.find { |a| a[:api_v1_technician_id] == tech.id }

          if found
            result.push({ allocation_id: found.id,
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

      # Genera las Allocations segun la Availability de cada tecnico
      def self.generate(ct_id, wk_id)
        contract = Contract.find_by(id: ct_id)

        requirements = contract.requirement

        technicians = Technician.candidates(ct_id, wk_id)
        availabilities = {}

        technicians.each do |technician|
          availabilities.merge!({ technician.id => technician.availability(ct_id, wk_id) })
        end

        allocated = allocate_techs(requirements, availabilities, technicians)

        delete_previous_allocation(ct_id, wk_id)
        register_allocation(allocated)
        list_hours(ct_id, wk_id)
      end

      def self.list_hours(ct_id, wk_id)
        result = []

        allocations = Allocation.where(api_v1_contract_id: ct_id, api_v1_week_id: wk_id)

        allocations.each do |allocation|
          result.push({ day_name: allocation.block.day.name,
                        day_id: allocation.block.day.id,
                        block_hour: allocation.block.hour,
                        block_id: allocation.api_v1_block_id,
                        week_id: allocation.api_v1_week_id,
                        week_number: allocation.week.number,
                        technician_id: allocation.api_v1_technician_id,
                        contract_id: allocation.api_v1_contract_id })
        end

        result
      end

      def self.allocate_techs(requirements, availabilities, technicians)
        days = days_required(requirements)

        if !availabilities.blank?
          week_id = availabilities&.first[1].first&.fetch(:week_id)
          contract_id = availabilities&.first[1].first&.fetch(:contract_id)
        end

        allocated = []

        days.each do |day_id|
          hours_required = hours_required(requirements, day_id)
          no_techs_for_day = false
          techs_counter = technicians.size

          while hours_required.size.positive? && techs_counter.positive? && !no_techs_for_day
            winner = { tech_id: -1, pendings: hours_required.size, array: hours_required }

            technicians.each do |tech|
              hours_technician = hours_technician(availabilities.fetch(tech.id), day_id)

              array_pendings = (hours_required - hours_technician)

              if array_pendings.size < winner[:pendings]
                winner = { tech_id: tech.id, pendings: array_pendings.size, array: array_pendings }
              end
            end

            hours_allocated = hours_required - winner.fetch(:array)

            hours_allocated.each do |hour_allocated|
              allocated.push({ day_id:,
                               block_id: hour_allocated,
                               week_id:,
                               technician_id: winner.fetch(:tech_id),
                               contract_id: })
            end

            no_techs_for_day = true if hours_allocated.size.zero?

            hours_required = winner.fetch(:array)
            techs_counter -= 1
          end
        end

        allocated
      end

      def self.days_required(requirements)
        requirements.map { |e| e[:day_id] }.uniq
      end

      def self.hours_required(requirements, day_id)
        requirements.filter { |e| e[:day_id] == day_id }.map { |e| e[:block_id] }
      end

      def self.hours_technician(availability, day_id)
        availability.filter { |e| e[:day_id] == day_id }.map { |e| e[:block_id] }
      end

      def self.register_allocation(allocated)
        allocated.each do |e|
          allocation = Allocation.new api_v1_block_id: e[:block_id], api_v1_week_id: e[:week_id],
                                      api_v1_technician_id: e[:technician_id], api_v1_contract_id: e[:contract_id]

          allocation.save!
        end

        allocated
      end

      def self.delete_previous_allocation(ct_id, wk_id)
        Allocation.where(api_v1_contract_id: ct_id, api_v1_week_id: wk_id).destroy_all
      end
    end
  end
end
