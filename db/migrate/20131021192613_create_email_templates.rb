class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      has_one :campaign
      t.string :name
      t.text :email_template
      t.date :published_on

      t.timestamps
    end
  end
end
