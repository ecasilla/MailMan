class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :users, null: false, index: true


      t.timestamps
    end

    reversible do |dir|
      dir.up do
        execute <<-SQL  
          ALTER TABLE contacts
          ADD CONSTRAINT fk_contacts_users
          FOREIGN KEY (users_id)
          REFERENCES users(id)
        SQL
      end
    end
  end
end
