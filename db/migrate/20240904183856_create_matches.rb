class CreateMatches < ActiveRecord::Migration[7.2]
  def change
    create_table :matches do |t|
      t.references :contact
      t.references :role
      t.timestamps
    end
  end
end
