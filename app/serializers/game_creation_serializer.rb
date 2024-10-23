class GameCreationSerializer
  def self.new_game_json(user, friend, game)
    {
      "data": {
        "type": "game_creation",
        "game_id": game.id,
        "attributes": {
          "game": {
            "game": game.game,
            "avatar": game.avatar,
            "status": game.status
          },
          "user": {
            "id": user.id,
            "username": user.username,
            "avatar": user.avatar
          },
          "friend": {
            "friend_id": friend.id,
            "username": friend.username,
            "avatar": friend.avatar
          }
        }
      }
    }
  end
end