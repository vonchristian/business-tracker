class CreateMayorsFees < ActiveRecord::Migration
  def change
    create_table :mayors_fees do |t|
      t.string :enterprise_scale
      t.string :asset_size
      t.string :workforce_size
      t.string :line_of_business_id
      t.decimal :amount_of_fee_per_anum

      t.timestamps null: false
    end
  end
end
