class AddCollectingOfficerToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :collecting_officer, :string
  end
end
