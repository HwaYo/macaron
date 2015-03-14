class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.string :name
      t.string :image
      t.integer :age
      t.integer :gender
      t.timestamps null: false
    end
  end
end
