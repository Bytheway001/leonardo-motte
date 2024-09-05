class Role < ApplicationRecord
  validates :name, presence: true
  validates :position, presence: true
  validates :start_date, presence: true
  validates :placement_date, presence: true
  validates :status_id, presence: true

end