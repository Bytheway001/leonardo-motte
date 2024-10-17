class CreateMatchStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :match_statuses do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps
    end
  end
end
