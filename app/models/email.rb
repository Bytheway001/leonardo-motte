class Email < ApplicationRecord
    belongs_to :contact
    validates :email, presence: true
     validates :email_type, presence: true
end
