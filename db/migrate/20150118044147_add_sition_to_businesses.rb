class AddSitionToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :sitio, :string
  end
end
