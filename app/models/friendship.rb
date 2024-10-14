class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'
  
  validates :user_id, uniqueness: { scope: :friend_id }
  validate :not_self

  def not_self
    errors.add(:friend_id, "can't be the same as user") if user_id == friend_id
  end
end