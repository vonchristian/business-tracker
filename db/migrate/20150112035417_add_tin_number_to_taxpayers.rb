class AddTinNumberToTaxpayers < ActiveRecord::Migration
  def change
    add_column :taxpayers, :tin_number, :string
  end
end
