class GamesSerializer
  def self.games_json(games)
    {
      "data": {
    "resources": [
      { "game_id": 1,
        "game": "chess", 
        "status": "active/inactive",
        "avatar": "fileName/Path"
      },
      {  "game_id": 2,
        "game": "chess",
        "status": "active/inactive",
        "avatar": "fileName/Path"
          }
        ]
      }
    }
  end
end