class CreateEducationHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :education_histories do |t|
      t.references :school 
      t.string :title
      t.date :start_date
      t.date :degree_date
      t.boolean :undergrad
      t.timestamps
    end
  end
end