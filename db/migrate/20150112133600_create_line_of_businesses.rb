class CreateLineOfBusinesses < ActiveRecord::Migration
  def change
    create_table :line_of_businesses do |t|
      t.integer :business_id
      t.string :description
      t.string :psic_code

      t.timestamps null: false
    end
  end
end
