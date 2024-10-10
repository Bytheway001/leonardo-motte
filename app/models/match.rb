class Match < ApplicationRecord
  belongs_to :contact
  belongs_to :role
  has_many :activities, as: :activitable  # Relación polimórfica
end
