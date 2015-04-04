class ChangeColumnToInteger < ActiveRecord::Migration
  def change
    change_column :businesses, :permit_number, 'integer USING CAST(permit_number AS integer)'
  end
end
