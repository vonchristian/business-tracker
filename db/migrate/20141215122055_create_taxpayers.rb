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
      t.string :tin
      t.string :workflow_state

      t.timestamps null: false
    end
  end
end
