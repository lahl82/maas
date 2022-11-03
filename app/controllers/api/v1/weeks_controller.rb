# frozen_string_literal: true

module Api
  module V1
    # Controlador para retornar las semanas disponibles para consultar
    class WeeksController < ApplicationController
      def index
        @weeks = Weeks.range(-5, 5)
        render json: @weeks
      end
    end
  end
end
