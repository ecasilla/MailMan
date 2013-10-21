class CreateTemplates < ActiveRecord::Migration
  def change
    create_table :templates do |t|
      t.string :template_name, null: false
      t.text :template, null: false
      t.references :users, null: false, index: true


      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL  
          ALTER TABLE templates
          ADD CONSTRAINT fk_templates_users
          FOREIGN KEY (users_id)
          REFERENCES users(id)
        SQL
      end
    end
  end
end

