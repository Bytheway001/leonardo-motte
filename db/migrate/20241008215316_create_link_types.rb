class CreateLinkTypes < ActiveRecord::Migration[7.2]
  def change
    create_table :link_types do |t|
      t.string :pattern 
      t.string :name

      t.timestamps
    end
  end
end
