class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.string :name, null:false
      t.string :email, null: false
      t.text :comment, null: false
    end
  end
end
