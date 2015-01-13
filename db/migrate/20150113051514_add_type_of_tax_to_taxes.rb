class AddTypeOfTaxToTaxes < ActiveRecord::Migration
  def change
    add_column :taxes, :type_of_tax, :integer
  end
end
