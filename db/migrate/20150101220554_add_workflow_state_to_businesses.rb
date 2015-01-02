class AddWorkflowStateToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :workflow_state, :string
  end
end
