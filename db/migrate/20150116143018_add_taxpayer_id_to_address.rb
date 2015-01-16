class AddTaxpayerIdToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :taxpayer_id, :integer
    add_column :addresses, :business_id, :integer
  end
end
