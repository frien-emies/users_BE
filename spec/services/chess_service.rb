require "rails_helper"

RSpec.describe "Chess Service" do
  it "searches the chess BE API for a game" do
    @user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/baby.jpg")
    @user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/queen.jpg")
    @user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/elephant.jpg")

    @body = {
              "white_player_id": @user1.id, 
              "black_player_id": @user2.id, 
              "white_player_user_name": @user1.username, 
              "black_player_user_name": @user2.username
            }
    results = ChessService.get_game_info(@user1, @user2)

    expect(results).to be_a(Hash)
    expect(results).to have_key(:game)
    expect(results[:game]).to be_a(Hash)
    
    expect(results[:game]).to have_key(:id)
    expect(results[:game][:id]).to be_an(Integer)
    
    expect(results[:game]).to have_key(:type)
    expect(results[:game][:type]).to be_a(String)
    expect(results[:game][:type]).to eq("game_information")
    
    expect(results[:game]).to have_key(:attributes)
    expect(results[:game][:attributes]).to be_a(Hash)
    
    attrs = results[:game][:attributes]
    
    expect(attrs[:black_player_id]).to be_an(Integer)
    expect(attrs[:black_player_points]).to be_an(Integer)
    expect(attrs[:black_player_user_name]).to be_a(String)
    expect(attrs[:black_player_user_name]).to eq(@user2.username)
    expect(attrs[:game_champion]).to be nil
    expect(attrs[:game_complete]).to be false
    expect(attrs[:game_outcome]).to be nil
    expect(attrs[:turn_color]).to be_a(String)
    expect(attrs[:turn_number]).to be_an(Integer)
    expect(attrs[:white_player_id]).to be_an(Integer)
    expect(attrs[:white_player_points]).to be_an(Integer)
    expect(attrs[:white_player_user_name]).to be_a(String)
    expect(attrs[:white_player_user_name]).to eq(@user1.username)
  end
end