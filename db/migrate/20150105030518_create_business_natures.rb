class CreateBusinessNatures < ActiveRecord::Migration
  def change
    create_table :business_natures do |t|
      t.string :description
      t.string :psic_code
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
