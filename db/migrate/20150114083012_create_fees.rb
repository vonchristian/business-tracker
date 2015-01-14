class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.decimal :amount
      t.integer :line_of_business_id

      t.timestamps null: false
    end
  end
end
