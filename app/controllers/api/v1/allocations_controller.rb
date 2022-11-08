# frozen_string_literal: true

module Api
  module V1
    # class AllocationsController < ApplicationController
    class AllocationsController < ApplicationController
      def index
        contract = Contract.find_by(id: allocation_params.fetch(:contract_id))
        week = Week.find_by(id: allocation_params.fetch(:week_id))

        response = Allocation.list(contract, week)
        render json: response
      end

      def create
        ct_id = allocation_params.fetch(:contract_id)
        wk_id = allocation_params.fetch(:week_id)

        response = Allocation.generate(ct_id, wk_id)
        render json: response
      end

      private

      def allocation_params
        params.permit(:contract_id, :week_id)
      end
    end
  end
end
