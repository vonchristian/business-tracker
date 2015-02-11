class CreatePoliceClearances < ActiveRecord::Migration
  def change
    create_table :police_clearances do |t|
      t.text :other_identification_marks
      t.text :remarks
      t.string :purpose
      t.string :build
      t.string :height
      t.string :weight
      t.integer :taxpayer_id


      t.timestamps null: false
    end
  end
end
