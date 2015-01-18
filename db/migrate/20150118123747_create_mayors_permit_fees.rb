class CreateMayorsPermitFees < ActiveRecord::Migration
  def change
    create_table :mayors_permit_fees do |t|
      t.decimal :amount
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
