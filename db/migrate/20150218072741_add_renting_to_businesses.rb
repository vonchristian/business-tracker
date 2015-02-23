class AddRentingToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :renting, :boolean
  end
end
