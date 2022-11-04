# frozen_string_literal: true
require "rails_helper"

RSpec.describe Api::V1::Week, type: :model do
    describe "Weeks" do
        it "Genera un rango de -5 hasta +5 semanas a partir de la ultima creada" do
          contract = FactoryBot.create(:api_v1_contract)
          day = FactoryBot.create(:api_v1_day, contract:)
          block = FactoryBot.create(:api_v1_block, day:)
          weeks = FactoryBot.create_list(:api_v1_week, 52)
          technician = FactoryBot.create(:api_v1_technician)
          week = weeks.last
          available = FactoryBot.create(:api_v1_available, block:, week:, technician:, contract:)

          expect(week.range(contract, technician).size).to be >= 6
        end

        it "Genera solo un rango de +5 cuando esta vacia la tabla Available, a partir de la semana calendario actual" do
          pending("Aun pendiente por montar esta segunda spec")
          expect(week.range(contract, technician).size).to be = 5
        end
    end
end
