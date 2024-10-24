class ChessService
  def self.get_game_info(game)
    conn = Faraday.new("link goes here")

    response = conn.get("path goes here") # do |req|
    #   req.params[:location] = town
    #   req.params[:key] = Rails.application.credentials.mapquest[:key]
    # end

    JSON.parse(response.body, symbolize_names: true)
  end

end