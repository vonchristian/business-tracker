class CreatePoliceClearanceFees < ActiveRecord::Migration
  def change
    create_table :police_clearance_fees do |t|
      t.decimal :amount
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
