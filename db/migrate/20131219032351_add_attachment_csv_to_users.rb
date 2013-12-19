class AddAttachmentCsvToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :csv
    end
  end

  def self.down
    drop_attached_file :users, :csv
  end
end
