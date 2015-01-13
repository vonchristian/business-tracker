class CreateTypeOfOrganizations < ActiveRecord::Migration
  def change
    create_table :type_of_organizations do |t|
      t.integer :business_id

      t.timestamps null: false
    end
  end
end
