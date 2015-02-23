class CreateCedulas < ActiveRecord::Migration
  def change
    create_table :cedulas do |t|
      t.decimal :basic_community_tax
      t.decimal :additional_tax
      t.decimal :gross_receipts_of_business
      t.decimal :income_from_real_property
      t.decimal :gross_receipts_of_earnings
      t.integer :taxpayer_id
      t.decimal :subtotal
      t.decimal :interest
      t.decimal :total_amount
      t.string :place_of_issue
      t.date    :date_of_issue
      t.string :citizenship
      t.integer :civil_status
      t.integer :gender
      t.date :date_of_birth
      t.string :place_of_birth
      t.string :height
      t.string :weight
      t.string :occupation


      t.timestamps null: false
    end
    add_index :cedulas, :taxpayer_id
  end
end
