# frozen_string_literal: true

module Api
  module V1
    class AvailablesController < ApplicationController
      def index
        wk_id = available_params.fetch(:week_id)
        bk_id = available_params.fetch(:block_id)

        response = Technician.availability_per_block(wk_id, bk_id)
        render json: response
      end

      private

      def available_params
        params.permit(:week_id, :block_id)
      end
    end
  end
end
