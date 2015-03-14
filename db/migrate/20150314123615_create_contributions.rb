class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.belongs_to :user
      t.belongs_to :fund
      t.integer :amount
      t.text :message
      t.timestamps null: false
    end
  end
end
