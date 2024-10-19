class LinkType < ApplicationRecord
    has_many :links
    validates :pattern, presence: true
    validates :name, presence: true
  end