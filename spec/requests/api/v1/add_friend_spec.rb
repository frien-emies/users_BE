require 'rails_helper'

RSpec.describe "Add Friend" do 
  describe "happy path" do 
    it "user can add a friend" do 
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      post_body = ({
        user_id: user2.id
      })

      expect(user1.friendships.count).to be 0
  
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users/#{user1.id}/add_friend", params: JSON.generate(post_body), headers: headers
    
      expect(response).to be_successful
      expect(response.status).to be 201
      expect(user1.friendships.count).to be 1
      expect(user2.inverse_friendships.count).to be 1

      reply = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(reply).to eq("You've added a friend!")
    end
  end

  describe "sad path" do 
    it "can handle error for adding self as friend" do 
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      post_body = ({
        user_id: user1.id
      })

      expect(user1.friendships.count).to be 0
  
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users/#{user1.id}/add_friend", params: JSON.generate(post_body), headers: headers
    
      expect(response.status).to be 400
      expect(user1.friendships.count).to be 0

      reply = JSON.parse(response.body, symbolize_names: true)[:errors][0]
      expect(reply[:message]).to eq("Validation failed: Friend can't be the same as user")
      expect(reply[:status]).to eq("400")
    end

    it "can handle error for adding friend that is already a friend" do 
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      Friendship.create!(user: user1, friend: user2)
      post_body = ({
        user_id: user2.id
      })

      expect(user1.friendships.count).to be 1
  
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users/#{user1.id}/add_friend", params: JSON.generate(post_body), headers: headers
    
      expect(response.status).to be 400
      expect(user1.friendships.count).to be 1

      reply = JSON.parse(response.body, symbolize_names: true)[:errors][0]
      
      expect(reply[:message]).to eq("Validation failed: User has already been taken")
      expect(reply[:status]).to eq("400")
    end

    it "can handle error for adding non existent user as friend" do 
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      post_body = ({
        user_id: 12345678
      })

      expect(user1.friendships.count).to be 0
  
      headers = {"CONTENT_TYPE" => "application/json"}
      post "/api/v1/users/#{user1.id}/add_friend", params: JSON.generate(post_body), headers: headers
    
      expect(response.status).to be 400
      expect(user1.friendships.count).to be 0

      reply = JSON.parse(response.body, symbolize_names: true)

      expect(reply).to have_key(:errors)
      expect(reply[:errors]).to be_a(String)
      expect(reply[:errors]).to eq("One of more of the users do not exist in the database.")
    end
  end
end

