# frozen_string_literal: true

class CreateApiV1TechnicianAssociations < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_technician_associations do |t|
      t.references :api_v1_technician, null: false, foreign_key: true
      t.references :api_v1_contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
