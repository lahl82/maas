# frozen_string_literal: true

module Api
  module V1
    # Controlador para listar todos los Tecnicos que monitorean los servicios
    class TechniciansController < ApplicationController
      def index
        @technicians = Technician.all
        render json: @technicians
      end
    end
  end
end
