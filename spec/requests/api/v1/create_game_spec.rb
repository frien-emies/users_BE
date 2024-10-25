require 'rails_helper'

RSpec.describe 'User Login Request', type: :request do
### - HAPPY PATH >:) - ###
  before(:each) do
    @user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/baby.jpg")
    @user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/queen.jpg")
    @user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/elephant.jpg")

    @body = {
              "white_player_id": @user1.id, 
              "black_player_id": @user2.id, 
              "white_player_user_name": @user1.username, 
              "black_player_user_name": @user2.username
            }

  end
  it "successfully creates a game and returns a json response" do
    post "/api/v1/users/#{@user1.id}/start_game", params: @body

    expect(response).to be_successful
    expect(response.status).to eq(201)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:type)
    expect(json[:type]).to be_a(String)
    expect(json[:type]).to eq("game_creation")
    
    expect(json).to have_key(:game_id)
    expect(json[:game_id]).to be_an(Integer)
    
    expect(json).to have_key(:attributes)
    expect(json[:attributes]).to be_a(Hash)

## TEST GAME
    game = json[:attributes][:game]

    expect(game).to have_key(:game)
    expect(game[:game]).to be_a(String)
    expect(game[:game]).to eq("Chess")

    expect(game).to have_key(:avatar)
    expect(game[:avatar]).to be_a(String)
    expect(game[:avatar]).to eq("https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg")

    expect(game).to have_key(:status)
    expect(game[:status]).to be_a(String)
    expect(game[:status]).to eq("active")

## TEST USER
    user = json[:attributes][:user]

    expect(user).to have_key(:id)
    expect(user[:id]).to be_an(Integer)
    expect(user[:id]).to eq(@user1.id)

    expect(user).to have_key(:username)
    expect(user[:username]).to be_a(String)
    expect(user[:username]).to eq("bob")

    expect(user).to have_key(:avatar)
    expect(user[:avatar]).to be_a(String)
    expect(user[:avatar]).to eq("https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/baby.jpg")

## TEST FRIEND
    friend = json[:attributes][:friend]
    
    expect(friend).to have_key(:friend_id)
    expect(friend[:friend_id]).to be_an(Integer)
    expect(friend[:friend_id]).to eq(@user2.id)

    expect(friend).to have_key(:username)
    expect(friend[:username]).to be_a(String)
    expect(friend[:username]).to eq("rob")

    expect(friend).to have_key(:avatar)
    expect(friend[:avatar]).to be_a(String)
    expect(friend[:avatar]).to eq("https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/queen.jpg")
  end

### - SAD PATH >:( - ###
  it "fails to create a game with an invalid white id and returns an error handling json response" do
    post "/api/v1/users/1234567/start_game", params: @body

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors]).to be_a(String)
    expect(json[:errors]).to eq("Could not create game.")
  end

  it "fails to create a game with an invalid black id and returns an error handling json response" do
    wrong_body = {
              "white_player_id": @user1.id, 
              "black_player_id": 12345678, 
              "white_player_user_name": @user1.username, 
              "black_player_user_name": @user2.username
            }

    post "/api/v1/users/#{@user1.id}/start_game", params: wrong_body

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors]).to be_a(String)
    expect(json[:errors]).to eq("Could not create game.")
  end

  it "fails to create a game with 3 users and returns an error handling json response" do
    post "/api/v1/users/#{@user1.id}/start_game", params: @body

    game = Game.last

    expect(game).to be_valid
    
    game.users << @user3
    expect(game).to_not be_valid
  end
end