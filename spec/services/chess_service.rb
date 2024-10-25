require "rails_helper"

RSpec.describe "Chess Service" do
  xit "searches the chess BE API for a game" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/baby.jpg")
    results = ChessService.get_game_info(user)

    # binding.pry
  end
end



# {
#   "white_player_id": "1", 
#   "black_player_id": "2", 
#   "white_player_user_name": "theguy@theguy.com", 
#   "black_player_user_name": "thegrandmaster@chess.com"
# }