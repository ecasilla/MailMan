class AddColumnPhone < ActiveRecord::Migration
  def change
    add_column :recipients, :phone, :string
  end
end
