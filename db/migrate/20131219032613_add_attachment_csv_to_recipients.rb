class AddAttachmentCsvToRecipients < ActiveRecord::Migration
  def self.up
    change_table :recipients do |t|
      t.attachment :csv
    end
  end

  def self.down
    drop_attached_file :recipients, :csv
  end
end
