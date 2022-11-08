# frozen_string_literal: true

module Api
  module V1
    # Controlador para retornar las semanas disponibles para consultar
    class WeeksController < ApplicationController
      def index
        contract = Contract.find_by(id: week_params.fetch(:contract_id))
        technician = Technician.find_by(id: week_params[:technician_id])

        weeks = Week.new.range(contract, technician)
        render json: weeks
      end

      private

      def week_params
        params.permit(:contract_id, :technician_id)
      end
    end
  end
end
