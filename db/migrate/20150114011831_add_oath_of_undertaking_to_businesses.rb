class AddOathOfUndertakingToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :oath_of_undertaking, :boolean
  end
end
