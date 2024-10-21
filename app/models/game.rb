class Game < ApplicationRecord
# RELATIONSHIPS
  has_many :user_games
  has_many :users, through: :user_games

# VALIDATIONS
  validates :game, presence: true

  enum status: { active: 0, inactive: 1 }
end