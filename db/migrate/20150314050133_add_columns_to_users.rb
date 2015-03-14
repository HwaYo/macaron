class AddColumnsToUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :email
      t.string :image
      t.string :gender
      t.string :birthday
      t.integer :age
      t.string :token
    end
  end
end
