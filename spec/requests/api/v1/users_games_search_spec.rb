require "rails_helper"

RSpec.describe "Games Index", type: :request do
  describe "returns games" do
    before(:each) do
      @user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      @user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      @user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "image3_string_goes_here.jpg")
      @user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "image4_string_goes_here.jpg")
      @user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "image5_string_goes_here.jpg")
      @user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "image6_string_goes_here.jpg")
      @user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "image7_string_goes_here.jpg")

      @friendship1 = Friendship.create(user_id: @user1.id, friend_id: @user2.id)
      @friendship2 = Friendship.create(user_id: @user1.id, friend_id: @user3.id)
      @friendship3 = Friendship.create(user_id: @user1.id, friend_id: @user4.id)

      @friendship4 = Friendship.create(user_id: @user2.id, friend_id: @user3.id)
      @friendship5 = Friendship.create(user_id: @user2.id, friend_id: @user4.id)
      @friendship6 = Friendship.create(user_id: @user2.id, friend_id: @user5.id)
      
      @friendship7 = Friendship.create(user_id: @user7.id, friend_id: @user1.id)

      @game1 = Game.create(game: "chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0) # active
      @game2 = Game.create(game: "chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0) # active
      @game3 = Game.create(game: "chess", avatar: "https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg", status: 0) # active
      @game4 = Game.create(game: "checkers", avatar: "checkers_image_string_goes_here.jpg", status: 0) # inactive

      @usergame1 = UserGame.create(user_id: @user1.id, game_id: @game1.id, player_id: 1)
      @usergame2 = UserGame.create(user_id: @user2.id, game_id: @game1.id, player_id: 2)

      @usergame3 = UserGame.create(user_id: @user1.id, game_id: @game2.id, player_id: 1)
      @usergame4 = UserGame.create(user_id: @user3.id, game_id: @game2.id, player_id: 2)

      @usergame5 = UserGame.create(user_id: @user2.id, game_id: @game3.id, player_id: 1)
      @usergame6 = UserGame.create(user_id: @user3.id, game_id: @game3.id, player_id: 2)
    end

    it "can return an index on games" do
      get "/api/v1/users/#{@user1.id}/my_games"
      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(json.length).to eq(2)

      json.each do |game|
        expect(game).to have_key(:type)
        expect(game[:type]).to be_a(String)
        expect(game[:type]).to eq("game")

        expect(game).to have_key(:id)
        expect(game[:id]).to be_an(Integer)

        expect(game).to have_key(:attributes)
        expect(game[:attributes]).to be_a(Hash)

        expect(game[:attributes]).to have_key(:game)
        expect(game[:attributes][:game]).to be_a(String)
        expect(game[:attributes][:game]).to eq("chess")

        expect(game[:attributes]).to have_key(:status)
        expect(game[:attributes][:status]).to be_a(String)
        expect(game[:attributes][:status]).to eq("active")

        expect(game[:attributes]).to have_key(:avatar)
        expect(game[:attributes][:avatar]).to be_a(String)
        expect(game[:attributes][:avatar]).to eq("https://chess-with-frein-emies-e45d9fb62d80.herokuapp.com/images/chess_dab.jpg")
      end
    end

    it "can return the error message" do
      get "/api/v1/users/12345/my_games"
      expect(response.status).to eq 400

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:errors)
      expect(json[:errors]).to be_a(String)
      expect(json[:errors]).to eq("Could not load games.")
    end
  end
end