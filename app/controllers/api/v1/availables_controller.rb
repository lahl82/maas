# frozen_string_literal: true

module Api
  module V1
    # class AvailablesController < ApplicationController
    class AvailablesController < ApplicationController
      def index
        wk_id = available_params.fetch(:week_id)
        bk_id = available_params.fetch(:block_id)

        av = Technician.availability_per_block(wk_id, bk_id)
        render json: av
      end

      def create
        av = Available.new(api_v1_week_id: available_params[:week_id],
                           api_v1_block_id: available_params[:block_id],
                           api_v1_technician_id: available_params[:technician_id],
                           api_v1_contract_id: available_params[:contract_id])

        if av.save
          render json: av, status: :created
        else
          render json: av.errors, status: :unprocessable_entity
        end
      end

      def destroy
        av = Available.where(api_v1_week_id: available_params[:week_id],
                             api_v1_block_id: available_params[:block_id],
                             api_v1_technician_id: available_params[:technician_id],
                             api_v1_contract_id: available_params[:contract_id])

        if !av.blank?
          av.destroy_all
          # encontrado y eliminado
          render body: nil, status: :no_content
        else
          # no encontrado
          render body: nil, status: :not_found
        end
      end

      private

      def available_params
        params.permit(:id, :week_id, :block_id, :technician_id, :contract_id)
      end
    end
  end
end
