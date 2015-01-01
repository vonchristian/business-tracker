class CreateTaxes < ActiveRecord::Migration
  def change
    create_table :taxes do |t|
      t.string :description
      t.boolean :default
      t.integer :business_id
      t.decimal :amount

      t.timestamps null: false
    end
  end
end
