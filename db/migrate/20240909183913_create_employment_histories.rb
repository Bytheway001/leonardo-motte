class CreateEmploymentHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :employment_histories do |t|
      t.date :start_date
      t.date :end_date
      t.boolean :primary
      t.boolean :current
      t.references :contact
      t.references :company
      t.timestamps
    end
  end
end
