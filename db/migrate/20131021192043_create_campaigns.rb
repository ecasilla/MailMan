class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      has_one :templates
      t.references :users, null: false, index: true
      t.string :name
      t.date :date
      
      t.timestamp
    end
  end
end
