class AddAttachmentImageToTaxpayers < ActiveRecord::Migration
  def self.up
    change_table :taxpayers do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :taxpayers, :image
  end
end
