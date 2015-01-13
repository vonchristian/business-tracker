class CreateLineOfBusinessTaxes < ActiveRecord::Migration
  def change
    create_table :line_of_business_taxes do |t|
      t.integer :line_of_business_id
      t.integer :tax_id

      t.timestamps null: false
    end
  end
end
