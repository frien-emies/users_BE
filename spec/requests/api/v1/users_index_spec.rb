require 'rails_helper'

RSpec.describe 'Users Index', type: :request do
  describe 'returns users data - happy paths' do
    before(:each) do
      @user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "baby.jpg")
      @user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      @user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "image3_string_goes_here.jpg")
      @user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "image4_string_goes_here.jpg")
      @user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "image5_string_goes_here.jpg")
      @user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "image6_string_goes_here.jpg")
      @user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "image7_string_goes_here.jpg")
    end

    it "can return an index of all users in the database" do
      get "/api/v1/users/#{@user1.id}/index"
      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(json.length).to eq(6)
      expect(json).to be_an(Array)

      json.each do |user|
        expect(user).to have_key(:type)
        expect(user[:type]).to be_a(String)

        expect(user).to have_key(:id)
        expect(user[:id]).to be_a(String)

        expect(user).to have_key(:attributes)
        expect(user[:attributes]).to be_a(Hash)

        expect(user[:attributes]).to have_key(:username)
        expect(user[:attributes][:username]).to be_a(String)

        expect(user[:attributes]).to have_key(:email)
        expect(user[:attributes][:email]).to be_a(String)

        expect(user[:attributes]).to have_key(:avatar)
        expect(user[:attributes][:avatar]).to be_a(String)
      end
    end
  end
  
  describe 'returns users data - sad paths' do
    it "returns error handling if there are no users" do
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "baby.jpg")
      get "/api/v1/users/#{user1.id}/index"
      expect(response.status).to eq 200

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:data)
      expect(json[:data]).to be_an(Array)
      expect(json[:data]).to eq([])
    end

    it "returns error handling if the user id in the path is invalid" do
      get "/api/v1/users/12345678/index"
      expect(response.status).to eq 400

      json = JSON.parse(response.body, symbolize_names: true)

      expect(json).to have_key(:errors)
      expect(json[:errors]).to be_a(String)
      expect(json[:errors]).to eq("You must be logged in or create an account.")
    end
  end
end
