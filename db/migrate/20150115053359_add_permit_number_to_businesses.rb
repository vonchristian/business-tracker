class AddPermitNumberToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :permit_number, :string
  end
end
