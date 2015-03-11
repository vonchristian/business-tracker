class AddRevokeAttributeToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :revoked, :boolean, null: false,  default: false
    add_column :businesses, :revoked_at, :datetime
    add_column :businesses, :reason_of_revocation, :text
  end
end
