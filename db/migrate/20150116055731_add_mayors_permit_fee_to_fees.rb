class AddMayorsPermitFeeToFees < ActiveRecord::Migration
  def change
    add_column :fees, :mayors_permit_fee, :decimal
  end
end
