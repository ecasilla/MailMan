class RemoveColumnPhone < ActiveRecord::Migration
  def change
    remove_column :recipients, :phone
  end
end
