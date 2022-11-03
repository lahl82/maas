# frozen_string_literal: true

module Api
  module V1
    # Semanas disponbles para definir disponibilidades
    class Week < ApplicationRecord
      has_many :availables, foreign_key: 'api_v1_week_id'
      has_many :allocations, foreign_key: 'api_v1_week_id'

      def range (left, right)
        last_week = Available.last&.week&.number
        
        if last_week.nil?
          
        end

        where(number: ((last_week-left)..(last_week+right)))
      end
    end
  end
end
