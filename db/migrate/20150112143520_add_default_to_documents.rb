class AddDefaultToDocuments < ActiveRecord::Migration
  def change
    add_column :documents, :default, :boolean
  end
end
