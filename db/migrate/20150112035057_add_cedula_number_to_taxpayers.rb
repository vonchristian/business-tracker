class AddCedulaNumberToTaxpayers < ActiveRecord::Migration
  def change
    add_column :taxpayers, :cedula_number, :string
  end
end
