class AddColumnToFriend < ActiveRecord::Migration
  def change
    change_table :friends do |t|
      t.string :uid
      t.references :user, index: true
    end
  end
end
