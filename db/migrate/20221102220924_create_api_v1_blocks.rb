# frozen_string_literal: true

class CreateApiV1Blocks < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_blocks do |t|
      t.integer :hour
      t.references :api_v1_day, null: false, foreign_key: true

      t.timestamps
    end
  end
end
