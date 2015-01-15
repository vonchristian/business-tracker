class CreateTaxpayers < ActiveRecord::Migration
  def change
    create_table :taxpayers do |t|
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :suffix
      t.string :email
      t.string :mobile_number
      t.string :telephone_number
      t.string :tin_number
      t.string :workflow_state
      t.string :cedula_number

      t.timestamps null: false
    end
  end
end
