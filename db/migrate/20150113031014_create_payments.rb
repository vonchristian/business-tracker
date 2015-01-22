class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :amount
      t.integer :business_id
      t.integer :status
      t.string :official_receipt_number

      t.timestamps null: false
    end
  end
end
