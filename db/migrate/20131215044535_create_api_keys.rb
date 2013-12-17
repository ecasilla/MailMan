class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
      t.string :access_token
      t.references :users, null: false
      t.date :expires_at, default: 365.days.from_now 

      t.timestamps
    end
  end
end
