class CreateEmailTemplates < ActiveRecord::Migration
  def change
    create_table :email_templates do |t|
      t.references :campaign
      t.string :name
      t.text :body
      t.date :published_on

      t.timestamps
    end
  end
end
