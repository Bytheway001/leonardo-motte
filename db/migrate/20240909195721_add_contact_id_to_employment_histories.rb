class AddContactIdToEmploymentHistories < ActiveRecord::Migration[7.2]
  def change
    add_column :employment_histories, :contact_id, :integer
  end
end
