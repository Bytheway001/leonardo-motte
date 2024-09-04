class Role < ApplicationRecord

  # Validations
  validates :name, presence: true
  validates :position, presence: true
  validates :start_date, presence: true
  validates :placement_date, presence: true
  validates :status_id, presence: true

  #Associations
  # El metodo has many me da acceso a usar Role.matches
  has_many :matches

  # atraves  de matches
  has_many :contacts, through: :matches


end