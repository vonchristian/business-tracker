class AddBusinessIdToFees < ActiveRecord::Migration
  def change
    add_column :fees, :business_id, :integer
  end
end
