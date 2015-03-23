class AddDtiRegistrationToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :dti_registration, :boolean
  end
end
