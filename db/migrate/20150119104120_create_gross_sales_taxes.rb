class CreateGrossSalesTaxes < ActiveRecord::Migration
  def change
    create_table :gross_sales_taxes do |t|
      t.decimal :amount
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
