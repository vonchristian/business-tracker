class AddPlaceIssuedCedulaToTaxpayers < ActiveRecord::Migration
  def change
    add_column :taxpayers, :place_issued_cedula, :string
  end
end
