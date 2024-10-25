class ChessService
  def self.get_game_info(user, friend)
    conn = Faraday.new("https://chess-game-be-fmpc.onrender.com/") do |faraday|
      faraday.headers['Content-Type'] = 'application/json' 
    end

    response = conn.post("api/v1/new_game") do |req|
      req.body = {
        "white_player_id": user.id,
        "black_player_id": friend.id,
        "white_player_user_name": user.username,
        "black_player_user_name": friend.username
    }.to_json
    end

    JSON.parse(response.body, symbolize_names: true)
  end
end