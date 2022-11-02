class CreateAllocations < ActiveRecord::Migration[7.0]
  def change
    create_table :allocations do |t|
      t.references :block, null: false, foreign_key: true
      t.references :week, null: false, foreign_key: true
      t.references :technician, null: false, foreign_key: true

      t.timestamps
    end
  end
end
