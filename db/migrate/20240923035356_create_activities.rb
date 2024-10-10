class CreateActivities < ActiveRecord::Migration[7.2]
  def change
    create_table :activities do |t|
      t.string :name
      t.references :activitable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
