class AddRenewedAtToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :renewed_at, :datetime
  end
end
