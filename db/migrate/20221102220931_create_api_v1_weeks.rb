# frozen_string_literal: true

class CreateApiV1Weeks < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_weeks do |t|
      t.integer :number

      t.timestamps
    end
  end
end
