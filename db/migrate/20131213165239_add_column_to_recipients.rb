class AddColumnToRecipients < ActiveRecord::Migration
  def change
    add_column :recipients, :first_name, :string, null: false
    add_column :recipients, :last_name, :string, null: false
    add_column :recipients, :phone, :integer
  end
end
