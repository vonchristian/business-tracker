class CreateLineOfBusinesses < ActiveRecord::Migration
  def change
    create_table :line_of_businesses do |t|
      t.integer :business_id
      t.integer :business_nature_id

      t.timestamps null: false
    end

    add_index :line_of_businesses, :business_id
    add_index :line_of_businesses, :business_nature_id
  end
end
