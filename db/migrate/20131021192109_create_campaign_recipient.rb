class CreateCampaignRecipient < ActiveRecord::Migration
  def change
    create_table :campaigns_recipients do |t|
      t.belongs_to :campaign, null: false
      t.belongs_to :recipient, null: false
    end

    reversible do |dir|
      dir.up do

        execute <<-SQL
          ALTER TABLE campaigns_recipients
          ADD CONSTRAINT fk_campaign
          FOREIGN KEY (campaign_id)
          REFERENCES campaigns(id),
          ADD CONSTRAINT fk_receipients
          FOREIGN KEY (recipient_id)
          REFERENCES recipients(id)
        SQL
      end
    end
  end
end
