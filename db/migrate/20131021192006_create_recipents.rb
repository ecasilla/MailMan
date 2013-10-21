class CreateRecipents < ActiveRecord::Migration
  def change
    create_table :recipients do |t|
      t.string :name, null: false
      t.string :email, null: false
      t.references :users, null: false, index: true

      t.timestamps
    end
  end
end
