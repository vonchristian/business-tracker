class AddLineOfBusinessIdToTaxes < ActiveRecord::Migration
  def change
    add_column :taxes, :line_of_business_id, :integer
  end
end
