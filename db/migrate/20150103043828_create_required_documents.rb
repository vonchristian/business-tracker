class CreateRequiredDocuments < ActiveRecord::Migration
  def change
    create_table :required_documents do |t|
      t.string :description
      t.string :office
      t.date :date_issued

      t.timestamps null: false
    end
  end
end
