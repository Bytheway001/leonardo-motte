class CreateMatchStatuses < ActiveRecord::Migration[7.2]
  def change
    create_table :match_statuses do |t|
      t.string :nombre
      t.integer :padre_id

      t.timestamps
    end
  end
end
