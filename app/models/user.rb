class User < ApplicationRecord
# RELATIONSHIPS
  has_many :user_games
  has_many :games, through: :user_games
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend

  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  has_secure_password

# VALIDATIONS
  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  def self.search(search_params)
    where("username LIKE ?", "%#{search_params}%")
  end

  def friends_list
    list = []
    list << self.friends
    list << self.inverse_friends
    list.flatten.uniq
  end

  def games_list
    list = []
    list << self.games
    list.flatten.uniq
  end
end