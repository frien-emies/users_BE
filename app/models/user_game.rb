class UserGame < ApplicationRecord
# RELATIONSHIPS
  belongs_to :user
  belongs_to :game

# ENUM
  enum player_id: { white: 1, black: 2 }
end