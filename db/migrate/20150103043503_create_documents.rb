class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :description
      t.string :office
      t.date :date_issued
      t.boolean :default

      t.timestamps null: false
    end
  end
end
