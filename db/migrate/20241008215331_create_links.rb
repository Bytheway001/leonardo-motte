class CreateLinks < ActiveRecord::Migration[7.2]
  def change
    create_table :links do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :link_type, null: false, foreign_key: true
      t.string :url

      t.timestamps
    end
  end
end
