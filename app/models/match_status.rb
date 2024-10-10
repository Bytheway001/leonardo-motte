class MatchStatus < ApplicationRecord
    belongs_to :parent, class_name: "MatchStatus", optional: true
    has_many :children, class_name: "MatchStatus", foreign_key: "parent_id"
  end
  