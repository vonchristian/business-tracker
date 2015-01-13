class AddBusinessIdToRequiredDocuments < ActiveRecord::Migration
  def change
    add_column :required_documents, :business_id, :integer
    add_column :required_documents, :document_id, :integer
  end
end
