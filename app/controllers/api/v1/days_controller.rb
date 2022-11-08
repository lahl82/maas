# frozen_string_literal: true

module Api
  module V1
    # class Api::V1::DaysController < ApplicationController
    class DaysController < ApplicationController
      # Controlador para listar todos los dias registrados para un Contrato
      def index
        contract = Contract.find_by(id: days_params.fetch(:contract_id))

        days = Day.where(contract:)
        render json: days
      end

      private

      def days_params
        params.permit(:contract_id)
      end
    end
  end
end
