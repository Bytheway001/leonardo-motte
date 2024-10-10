class MatchStatus < ApplicationRecord
    belongs_to :padre, class_name: "MatchStatus", optional: true
    has_many :hijos, class_name: "MatchStatus", foreign_key: "padre_id"
  end