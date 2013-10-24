class ChangeRecipients < ActiveRecord::Migration
  def change
    rename_column :recipients, :users_id, :user_id
  end
end
