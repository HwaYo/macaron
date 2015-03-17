class AddApprovedToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :approved, :boolean, default: false
  end
end
