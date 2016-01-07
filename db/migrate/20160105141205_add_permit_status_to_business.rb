class AddPermitStatusToBusiness < ActiveRecord::Migration
  def change
    add_column :businesses, :permit_status, :integer
    add_column :businesses, :approved_at, :datetime 
  end
end
