class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :amount
      t.integer :business_id
      t.integer :tax_id

      t.timestamps null: false
    end
  end
end
