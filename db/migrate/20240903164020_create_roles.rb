class CreateRoles < ActiveRecord::Migration[7.2]
  def change
    create_table :roles do |t|
      t.string :name
      t.integer :position 
      t.date :start_date
      t.date :placement_date
      t.integer :status_id
      t.timestamps
    end
  end
end