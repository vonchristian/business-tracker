class AddEnterpriseScaleToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :enterprise_scale, :integer
  end
end
