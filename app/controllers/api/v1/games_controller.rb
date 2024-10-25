class Api::V1::GamesController < ApplicationController
  def create
    user = User.find_by(id: params[:id])
    friend = User.find_by(id: params[:black_player_id])

    if user && friend
      new_game = ChessService.get_game_info(user, friend)
      new_game_id = new_game[:game][:id]
      game = Game.create(id: new_game_id, game: "Chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0)

      if game.users.count < 2
        UserGame.create(user_id: user.id, game_id: new_game_id, player_id: 1)
        UserGame.create(user_id: friend.id, game_id: new_game_id, player_id: 2)
        render json: GameCreationSerializer.new_game_json(user, friend, game), status: 201
      else
        render json: { "errors": "Could not add a third user to this game." }, status: 400
      end
    else
      render json: { "errors": "Could not create game." }, status: 400
    end
  end
end