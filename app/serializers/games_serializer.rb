class GamesSerializer
  def self.games_json(games)
    {
      "data": games.map do |game|
        {
          "type": "game",
          "id": game.id,
          "attributes": {
            "game": game.game, 
            "status": game.status,
            "avatar": game.avatar
          }
        }
      end
    }
  end
end