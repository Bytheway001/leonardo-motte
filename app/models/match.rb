class Match < ApplicationRecord
  belongs_to :contact
  belongs_to :role
  has_many :activities, as: :activityable  # Relación polimórfica
end
