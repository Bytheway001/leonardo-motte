class Company < ApplicationRecord 
  has_many :employment_histories
  has_many :contacts, through: :employment_histories
  has_many :activities, as: :activityable  # Relación polimórfica
  
  validates :name, presence: true
  validates :location, presence: true
  validates :website, presence: true

end
