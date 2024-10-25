require 'rails_helper'

RSpec.describe "Remove Friend" do 
  describe "happy path" do 
    it "user can remove friend" do 
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      Friendship.create!(user: user1, friend: user2)
      Friendship.create!(user: user2, friend: user1)
      delete_body = ({
        user_id: user2.id
      })

      expect(user1.friendships.count).to be 1
  
      headers = {"CONTENT_TYPE" => "application/json"}
      delete "/api/v1/users/#{user1.id}/add_friend", params: JSON.generate(delete_body), headers: headers
    
      expect(response).to be_successful
      expect(response.status).to be 201
      expect(user1.friendships.count).to be 0
      expect(user2.inverse_friendships.count).to be 0
      expect(user2.friendships.count).to be 0
      expect(user1.inverse_friendships.count).to be 0

      reply = JSON.parse(response.body, symbolize_names: true)[:data]
      
      expect(reply).to eq("You've removed a friend!")
    end
  end
end