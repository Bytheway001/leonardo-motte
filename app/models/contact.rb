class Contact < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :phone_number, presence: true
    validates :li_public, presence: true
    validates :alias, presence: true
  end
  