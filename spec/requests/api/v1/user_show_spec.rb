require 'rails_helper'

RSpec.describe 'Users Show', type: :request do
  describe 'returns users data - happy paths' do
    before(:each) do
      @user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "baby.jpg")
      @user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
    end

    it "returns a json response including all of a user's information" do
      get "/api/v1/users/#{@user1.id}"
      expect(response.status).to eq 200

      user = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(user).to have_key(:type)
      expect(user[:type]).to be_a(String)
      expect(user[:type]).to eq("user")

      expect(user).to have_key(:id)
      expect(user[:id]).to be_a(String)
      expect(user[:id]).to eq(@user1.id.to_s)
      expect(user[:id]).to_not eq(@user2.id)

      expect(user).to have_key(:attributes)
      expect(user[:attributes]).to be_a(Hash)

      expect(user[:attributes]).to have_key(:username)
      expect(user[:attributes][:username]).to be_a(String)
      expect(user[:attributes][:username]).to eq(@user1.username)
      expect(user[:attributes][:username]).to_not eq(@user2.username)

      expect(user[:attributes]).to have_key(:email)
      expect(user[:attributes][:email]).to be_a(String)
      expect(user[:attributes][:email]).to eq(@user1.email)
      expect(user[:attributes][:email]).to_not eq(@user2.email)

      expect(user[:attributes]).to have_key(:avatar)
      expect(user[:attributes][:avatar]).to be_a(String)
      expect(user[:attributes][:avatar]).to eq(@user1.avatar)
      expect(user[:attributes][:avatar]).to_not eq(@user2.avatar)
    end
  end

  describe 'returns users data - sad paths' do
    it "returns error handling if there is no user" do
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "baby.jpg")
      get "/api/v1/users/1"
      expect(response.status).to eq 404
      
      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:errors)
      expect(json[:errors]).to be_a(String)
      expect(json[:errors]).to eq("User not found.")
    end
  end
end