class AddFullNameToTaxpayers < ActiveRecord::Migration
  def change
    add_column :taxpayers, :full_name, :string
  end
end
