class CreateGrossReceipts < ActiveRecord::Migration
  def change
    create_table :gross_receipts do |t|
      t.integer :business_id
      t.decimal :gross_sales_minimum
      t.decimal :gross_sales_maximum
      t.decimal :amount_of_tax_per_anum
      t.integer :line_of_business_id

      t.timestamps null: false
    end
  end
end
