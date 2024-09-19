class Company < ApplicationRecord 
  has_many :employment_histories
  has_many :contacts, through: :employment_histories
  
  validates :name, presence: true
  validates :location, presence: true
  validates :website, presence: true

end
