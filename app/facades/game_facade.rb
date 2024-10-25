class ForecastFacade
  def self.get_game_state(game)
    data = ChessService.get_game_info(game)

    # current_data = data[:current]
    # CurrentWeather.new(current_data)
  end
end