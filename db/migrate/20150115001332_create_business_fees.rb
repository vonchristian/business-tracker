class CreateBusinessFees < ActiveRecord::Migration
  def change
    create_table :business_fees do |t|
      t.integer :business_id
      t.integer :fee_id

      t.timestamps null: false
    end
  end
end
