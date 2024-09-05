class Contact < ApplicationRecord
  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :li_public, presence: true
  validates :alias, presence: true

  # Associations
  has_many :matches
  #atraves de matches
  has_many :roles, through: :matches
end
  