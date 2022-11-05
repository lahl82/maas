# frozen_string_literal: true

module Api
  module V1
    # class Allocation < ApplicationRecord
    class Allocation < ApplicationRecord
      belongs_to :block, foreign_key: 'api_v1_block_id'
      belongs_to :week, foreign_key: 'api_v1_week_id'
      belongs_to :technician, foreign_key: 'api_v1_technician_id'

      # Genera las Allocations segun la Availability de cada tecnico
      def generate(contract, week)
        requirements = contract.requirement

        technicians = Technician.candidates(contract, week)
        availabilities = {}

        technicians.each do |technician|
          availabilities.merge!({ technician.id => technician.availability(contract, week) })
        end

        allocate(requirements, availabilities, technicians)
      end

      private

      def allocate(requirements, availabilities, technicians)
        days = days_required(requirements)
        week_id = availabilities.first[1].first.fetch(:week_id)
        contract_id = availabilities.first[1].first.fetch(:contract_id)

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

      def days_required(requirements)
        requirements.map { |e| e[:day_id] }.uniq
      end

      def hours_required(requirements, day_id)
        requirements.filter { |e| e[:day_id] == day_id }.map { |e| e[:block_id] }
      end

      def hours_technician(availability, day_id)
        availability.filter { |e| e[:day_id] == day_id }.map { |e| e[:block_id] }
      end
    end
  end
end
