# frozen_string_literal: true

module Api
  module V1
    # Controlador para listar todos los Tecnicos que monitorean los servicios
    class TechniciansController < ApplicationController
      def index
        ct_id = technicians_params[:contract_id]

        if ct_id.blank?
          technicians = Technician.all
        else
          technicians = Technician.associated(ct_id)
        end

        render json: technicians
      end

      private

      def technicians_params
        params.permit(:contract_id, :week_id)
      end
    end
  end
end
