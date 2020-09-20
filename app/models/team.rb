class Team < ApplicationRecord
    has_many :players
    accepts_nested_attributes_for :players
    validates :username, presence: true
end


