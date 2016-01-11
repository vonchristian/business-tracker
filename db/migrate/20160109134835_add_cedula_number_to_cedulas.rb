class AddCedulaNumberToCedulas < ActiveRecord::Migration
  def change
    add_column :cedulas, :cedula_number, :string
  end
end
