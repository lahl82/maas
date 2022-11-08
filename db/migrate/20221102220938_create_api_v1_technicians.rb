# frozen_string_literal: true

class CreateApiV1Technicians < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_technicians do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
