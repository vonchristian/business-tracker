class AddTypeOfBusinessToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :type_of_business, :integer
  end
end
