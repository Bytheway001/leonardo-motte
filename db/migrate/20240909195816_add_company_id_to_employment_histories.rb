class AddCompanyIdToEmploymentHistories < ActiveRecord::Migration[7.2]
  def change
    add_column :employment_histories, :company_id, :integer
  end
end
