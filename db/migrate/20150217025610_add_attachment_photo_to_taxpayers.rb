class AddAttachmentPhotoToTaxpayers < ActiveRecord::Migration
  def self.up
    change_table :taxpayers do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :taxpayers, :photo
  end
end
