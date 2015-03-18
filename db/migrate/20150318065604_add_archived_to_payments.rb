class AddArchivedToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :archived, :boolean
  end
end
