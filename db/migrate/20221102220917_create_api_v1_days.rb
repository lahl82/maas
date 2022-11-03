class CreateApiV1Days < ActiveRecord::Migration[7.0]
  def change
    create_table :api_v1_days do |t|
      t.string :name
      t.references :api_v1_contract, null: false, foreign_key: true

      t.timestamps
    end
  end
end
