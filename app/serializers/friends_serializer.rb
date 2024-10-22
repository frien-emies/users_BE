class FriendsSerializer
  def self.friends_json(friends)
    {
      "data": friends.map do |friend|
        {
          "type": "friend",
          "id": friend.id,
          "attributes": {
            "username": friend.username,
            "avatar": friend.avatar
          }
        }
      end
    }
  end
end