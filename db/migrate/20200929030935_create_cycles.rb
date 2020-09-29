class CreateCycles < ActiveRecord::Migration[6.0]
  def change
    create_table :cycles do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :price, null:false
      t.timestamps
    end
  end
end
