class AddPaymentToContribution < ActiveRecord::Migration
  def change
    add_column :contributions, :payment, :string
  end
end
