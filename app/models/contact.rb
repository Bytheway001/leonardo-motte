class Contact < ApplicationRecord
  has_many :employment_histories
  has_many :companies, through: :employment_histories
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :li_public, presence: true
  validates :alias, presence: true
  end
  