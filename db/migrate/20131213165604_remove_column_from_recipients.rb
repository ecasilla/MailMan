class RemoveColumnFromRecipients < ActiveRecord::Migration
  def change
    remove_column :recipients, :name, :string
  end
end
