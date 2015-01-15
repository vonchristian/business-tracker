class CreateFees < ActiveRecord::Migration
  def change
    create_table :fees do |t|
      t.decimal :amount_of_fee_per_anum
      t.integer :enterprise_scale
      t.decimal :asset_size
      t.integer :workforce
      t.integer :type_of_business
      t.integer :line_of_business_id

      t.timestamps null: false
    end
  end
end
