# frozen_string_literal: true

module Api
  module V1
    # Semanas disponbles para definir disponibilidades
    class Week < ApplicationRecord
      has_many :availables, foreign_key: 'api_v1_week_id'
      has_many :allocations, foreign_key: 'api_v1_week_id'

      def range(contract, technician)
        days_before = 5
        days_after = 5
        last_week = Available.where(contract:, technician:).last&.week&.number

        if last_week.nil?
          start = current_calendar_week
          upto = start + days_after
        else
          start = last_week - days_before
          upto = last_week + days_after
        end

        Week.where(number: (start..upto))
      end

      private

      def current_calendar_week
        DateTime.now.strftime('%U').to_i
      end
    end
  end
end
