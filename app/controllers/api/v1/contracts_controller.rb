# frozen_string_literal: true

module Api
  module V1
    # clase Contratos de Servicios de MaaS
    class ContractsController < ApplicationController
      def index
        @contracts = Contract.where(status: true)
        render json: @contracts
      end
    end
  end
end
