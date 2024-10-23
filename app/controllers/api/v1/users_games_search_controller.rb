class Api::V1::UsersGamesSearchController < ApplicationController
  def index
  user = User.find_by(id: params[:id])
    if user == nil
      render json: { "errors": "Could not load games." }, status: 400
    else
      games = user.games_list
      render json: GamesSerializer.games_json(games), status: 200
    end
  end
end