class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title,     null: false
      t.text :detail,      null: false
      t.integer :area_id,  null: false
      t.float :rate,       null: false, default:"3"
      t.references :user,  null: false, foreign_key: true
      t.references :cycle, null: false, foreign_key: true
      t.timestamps
    end
  end
end