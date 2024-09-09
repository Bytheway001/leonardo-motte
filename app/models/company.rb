class Company < ApplicationRecord 
  validates :name, presence: true
  validates :location, presence: true
  validates :website, presence: true

end
