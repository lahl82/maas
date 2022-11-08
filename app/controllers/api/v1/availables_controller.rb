# frozen_string_literal: true

module Api
  module V1
    class AvailablesController < ApplicationController
      def index
        technician = Technician.find_by(id: available_params.fetch(:technician_id))
        wk_id = available_params.fetch(:week_id)
        dy_id = available_params.fetch(:day_id)

        response = technician.availability_per_day(wk_id, dy_id)
        render json: response
      end

      private

      def available_params
        params.permit(:technician_id, :week_id, :day_id)
      end
    end
  end
end
