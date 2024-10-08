class AddFieldsToEmploymentHistories < ActiveRecord::Migration[7.2]
  def change
    add_column :employment_histories, :school_id, :integer
    add_column :employment_histories, :title, :string
    add_column :employment_histories, :degree_date, :date
    add_column :employment_histories, :undergrad, :boolean
  end
end