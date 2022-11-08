# frozen_string_literal: true

module Api
  module V1
    # clase Contratos de Servicios de MaaS
    class ContractsController < ApplicationController
      before_action :set_contract, only: %i[show edit update destroy]

      def index
        @contracts = Contract.where(status: true)
        render json: @contracts
      end

      def show
        response = @contract.requirement
        render json: response
      end

      private

      def set_contract
        @contract = Contract.find(params[:id])
      end

      def contract_params
        # params.require(:contract).permit(:title, :content, :state)
      end
    end
  end
end
