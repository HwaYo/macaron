class CreateFunds < ActiveRecord::Migration
  def change
    create_table :funds do |t|
      t.belongs_to :user, index: true
      t.belongs_to :gift, index: true
      t.belongs_to :friend, index: true
      t.text :description
      t.integer :situation
      t.timestamps null: false
    end
  end
end
