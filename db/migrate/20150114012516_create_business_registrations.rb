class CreateBusinessRegistrations < ActiveRecord::Migration
  def change
    create_table :business_registrations do |t|
      t.integer :taxpayer_id
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
