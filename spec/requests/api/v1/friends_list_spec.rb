require 'rails_helper'

RSpec.describe 'Users Index', type: :request do
  describe 'returns users data - happy paths' do
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
    end

    it "can return an index of a user's friends" do
      get "/api/v1/users/#{@user1.id}/friends"
      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(json.length).to eq(4)

      json.each do |friend|
        expect(friend).to have_key(:type)
        expect(friend[:type]).to be_a(String)
        expect(friend[:type]).to eq("friend")

        expect(friend).to have_key(:id)
        expect(friend[:id]).to be_an(Integer)
        
        expect(friend).to have_key(:attributes)
        expect(friend[:attributes]).to be_a(Hash)

        expect(friend[:attributes]).to have_key(:username)
        expect(friend[:attributes][:username]).to be_a(String)

        expect(friend[:attributes]).to have_key(:avatar)
        expect(friend[:attributes][:avatar]).to be_a(String)
      end

      user2 = json[0]
      user3 = json[1]
      user4 = json[2]
      user7 = json[3] # inverse friend

      expect(user2[:id]).to eq(@user2.id)
      expect(user2[:attributes][:username]).to eq(@user2.username)
      expect(user2[:attributes][:avatar]).to eq(@user2.avatar)

      expect(user3[:id]).to eq(@user3.id)
      expect(user3[:attributes][:username]).to eq(@user3.username)
      expect(user3[:attributes][:avatar]).to eq(@user3.avatar)

      expect(user4[:id]).to eq(@user4.id)
      expect(user4[:attributes][:username]).to eq(@user4.username)
      expect(user4[:attributes][:avatar]).to eq(@user4.avatar)

      expect(user7[:id]).to eq(@user7.id)
      expect(user7[:attributes][:username]).to eq(@user7.username)
      expect(user7[:attributes][:avatar]).to eq(@user7.avatar)
    end

    it "can return a friends list for someone with only inverse friends" do
      get "/api/v1/users/#{@user3.id}/friends"
      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(json.length).to eq(2)

      json.each do |friend|
        expect(friend).to have_key(:type)
        expect(friend[:type]).to be_a(String)
        expect(friend[:type]).to eq("friend")

        expect(friend).to have_key(:id)
        expect(friend[:id]).to be_an(Integer)
        
        expect(friend).to have_key(:attributes)
        expect(friend[:attributes]).to be_a(Hash)

        expect(friend[:attributes]).to have_key(:username)
        expect(friend[:attributes][:username]).to be_a(String)

        expect(friend[:attributes]).to have_key(:avatar)
        expect(friend[:attributes][:avatar]).to be_a(String)
      end

      user1 = json[0]
      user2 = json[1]

      expect(user1[:id]).to eq(@user1.id)
      expect(user1[:attributes][:username]).to eq(@user1.username)
      expect(user1[:attributes][:avatar]).to eq(@user1.avatar)

      expect(user2[:id]).to eq(@user2.id)
      expect(user2[:attributes][:username]).to eq(@user2.username)
      expect(user2[:attributes][:avatar]).to eq(@user2.avatar)
    end

    it "can return a friends list for someone with only inverse friends" do
      get "/api/v1/users/12345678/friends"
      expect(response.status).to eq 400

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:errors)
      expect(json[:errors]).to be_a(String)
      expect(json[:errors]).to eq("Could not load friends list for this user.")
    end
  end
end
