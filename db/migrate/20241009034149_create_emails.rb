class CreateEmails < ActiveRecord::Migration[7.2]
  def change
    create_table :emails do |t|
      t.string :email
      t.string :email_type
      t.boolean :preferred

      t.timestamps
    end
  end
end
