class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :name
      t.string :link
      t.string :image
      t.integer :gender
      t.integer :min_age
      t.integer :max_age
      t.integer :price
      t.timestamps null: false
    end
  end
end
