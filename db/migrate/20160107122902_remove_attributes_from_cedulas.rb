class RemoveAttributesFromCedulas < ActiveRecord::Migration
  def change
    remove_column :cedulas, :gender, :integer
    remove_column :cedulas, :citizenship, :string
    remove_column :cedulas, :civil_status, :integer
    remove_column :cedulas, :date_of_birth, :datetime
    remove_column :cedulas, :occupation, :string
    remove_column :cedulas, :height, :string
    remove_column :cedulas, :weight, :string
  end
end
