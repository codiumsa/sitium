class AddAttachmentImageToEntries < ActiveRecord::Migration[5.0]
  def self.up
    change_table :entries do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :entries, :image
  end
end
