# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Week, type: :model do
  describe 'Weeks' do
    after(:each) do
      FactoryBot.reload
    end

    before(:each) do
      weeks = FactoryBot.create_list(:api_v1_week, 52)
      @week = weeks.last
    end

    let(:contract) { FactoryBot.create(:api_v1_contract) }
    let(:day) { FactoryBot.create(:api_v1_day, contract:) }
    let(:block) { FactoryBot.create(:api_v1_block, day:) }
    let(:technician) { FactoryBot.create(:api_v1_technician) }

    it 'Genera un rango de -5 hasta +5 semanas a partir de la ultima creada' do
      FactoryBot.create(:api_v1_available, block:, week: @week, technician:, contract:)

      # p contract.name
      # p contract.availables.size
      # p technician.name
      # p @week.number

      expect(@week.range(contract, technician).size).to be >= 6
    end

    it 'Genera solo un rango de +5 cuando esta vacia la tabla Available, a partir de la semana calendario actual' do
      # p contract.name
      # p contract.availables.size
      # p technician.name
      # p @week.number

      expect(@week.range(contract, technician).size).to be == 6
    end
  end
end
