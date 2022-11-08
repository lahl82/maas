# frozen_string_literal: true

module Api
  module V1
    # class BlocksController < ApplicationController
    class BlocksController < ApplicationController
      # Controlador para listar todos los blocks (horas) registradas para un dia de un contrato
      def index
        # day = Day.find_by(id: blocks_params.fetch(:day_id))

        blocks = Block.where(api_v1_day_id: blocks_params.fetch(:day_id))
        render json: blocks
      end

      private

      def blocks_params
        params.permit(:day_id)
      end
    end
  end
end
