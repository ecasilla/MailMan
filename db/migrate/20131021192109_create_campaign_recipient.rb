class CreateCampaignRecipient < ActiveRecord::Migration
  def change
    create_table :campaigns_recipients do |t|
      t.belongs_to :campaigns, null: false
      t.belongs_to :recipients, null: false
    end

    reversible do |dir|
      dir.up do
        
        execute <<-SQL
          ALTER TABLE camp_recips
          ADD CONSTRAINT fk_campaign
          FOREIGN KEY (campaign_id)
          REFERENCES campaigns(id),
          ADD CONSTRAINT fk_receipients
          FOREIGN KEY (receipients_id)
          REFERENCES receipients(id)
        SQL
      end
    end
  end
end
