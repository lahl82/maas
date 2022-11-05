# frozen_string_literal: true

module Api
  module V1
    class AvailablesController < ApplicationController
      def index
        technician = Technician.find_by(id: available_params.fetch(:technician_id))
        contract = Contract.find_by(id: available_params.fetch(:contract_id))
        week = Week.find_by(id: available_params.fetch(:week_id))
        
        response = technician.availability(contract, week)
        render json: response
      end

      private

      def available_params
        params.permit(:technician_id, :contract_id, :week_id)
      end
    end
  end
end
