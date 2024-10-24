class Game < ApplicationRecord
# RELATIONSHIPS
  has_many :user_games
  has_many :users, through: :user_games

# VALIDATIONS
  validates :game, presence: true
  validate :maximum_two_users

# ENUM
  enum status: { active: 0, inactive: 1 }

private
  def maximum_two_users
    if users.size > 2
      errors.add(:users, "can only have a maximum of 2 users.")
    end
  end
end