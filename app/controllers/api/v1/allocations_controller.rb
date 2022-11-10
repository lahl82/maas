# frozen_string_literal: true

module Api
  module V1
    # class AllocationsController < ApplicationController
    class AllocationsController < ApplicationController
      def index
        wk_id = allocation_params.fetch(:week_id)
        bk_id = allocation_params.fetch(:block_id)

        al = Allocation.allocation_per_block(wk_id, bk_id)
        render json: al
      end

      def generate
        ct_id = allocation_params.fetch(:contract_id)
        wk_id = allocation_params.fetch(:week_id)

        al = Allocation.generate(ct_id, wk_id)
        if !al.blank?
          # generado
          render body: nil, status: :no_content
        else
          # no generado
          render body: nil, status: :not_found
        end
      end

      def create
        al = Allocation.new(api_v1_week_id: allocation_params[:week_id],
                           api_v1_block_id: allocation_params[:block_id],
                           api_v1_technician_id: allocation_params[:technician_id],
                           api_v1_contract_id: allocation_params[:contract_id])

        if al.save
          render json: al, status: :created
        else
          render json: al.errors, status: :unprocessable_entity
        end
      end

      def destroy
        al = Allocation.where(api_v1_week_id: allocation_params[:week_id],
                             api_v1_block_id: allocation_params[:block_id],
                             api_v1_technician_id: allocation_params[:technician_id],
                             api_v1_contract_id: allocation_params[:contract_id])

        if !al.blank?
          al.destroy_all
          # encontrado y eliminado
          render body: nil, status: :no_content
        else
          # no encontrado
          render body: nil, status: :not_found
        end
      end

      private

      def allocation_params
        params.permit(:id, :week_id, :block_id, :technician_id, :contract_id)
      end
    end
  end
end
