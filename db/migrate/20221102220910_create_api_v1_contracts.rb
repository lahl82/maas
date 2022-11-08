# frozen_string_literal: true

class CreateApiV1Contracts < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_contracts do |t|
      t.string :name
      t.boolean :status

      t.timestamps
    end
  end
end
