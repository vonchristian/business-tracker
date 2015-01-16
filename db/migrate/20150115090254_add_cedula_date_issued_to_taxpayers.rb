class AddCedulaDateIssuedToTaxpayers < ActiveRecord::Migration
  def change
    add_column :taxpayers, :cedula_date_issued, :date
  end
end
