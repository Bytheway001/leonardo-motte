class Link < ApplicationRecord
    belongs_to :contact
    belongs_to :link_type
  
    validates :url, presence: true
  end