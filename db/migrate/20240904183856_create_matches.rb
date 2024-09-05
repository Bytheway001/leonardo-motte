class CreateMatches < ActiveRecord::Migration[7.2]
  def change
    create_table :matches do |t|
      t.references :contact, null: false, foreign_key: true
      t.references :role, null: false, foreign_key: true

      t.timestamps
    end

    # Añade un índice único para evitar que se repitan combinaciones de contact_id y role_id
    add_index :matches, [:contact_id, :role_id], unique: true
  end
end