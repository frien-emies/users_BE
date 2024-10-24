class Api::V1::GamesController < ApplicationController
  def create
    user = User.find_by(id: params[:id])
    friend = User.find_by(id: params[:friend_id])
    game = Game.create(game: "Chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0)
    
    if user && friend
      if game.users.count < 2
        UserGame.create(user_id: user.id, game_id: game.id, player_id: 1)
        UserGame.create(user_id: friend.id, game_id: game.id, player_id: 2)
        render json: GameCreationSerializer.new_game_json(user, friend, game), status: 201
      else
        render json: { "errors": "Could add a third user to this game." }, status: 400
      end
    else
      render json: { "errors": "Could not create game." }, status: 400
    end
  end
end