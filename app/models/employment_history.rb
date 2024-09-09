class EmploymentHistory < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  #Verifica que el valor de primary esté dentro del conjunto [true, false].
  validates :primary
  validates :current 
 
  belongs_to :contact
  belongs_to :company
end