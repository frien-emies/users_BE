require 'rails_helper'

RSpec.describe 'Users Search - Index', type: :request do
  describe 'returns user data' do
    it 'can return users by partial search on username' do
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "image3_string_goes_here.jpg")
      user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "image4_string_goes_here.jpg")
      user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "image5_string_goes_here.jpg")
      user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "image6_string_goes_here.jpg")
      user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "image7_string_goes_here.jpg")
      
      query = "j"
      get "/api/v1/users/search?query=#{query}"

      expect(response.status).to eq 200

      users = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(users.count).to eq(2)

      first = users.first

      expect(first[:type]).to eq("user")
      expect(first[:id]).to eq(user4.id.to_s)
      expect(first[:attributes][:username]).to eq("jan")
      expect(first[:attributes][:email]).to eq("jan@turing.com")
      expect(first[:attributes][:avatar]).to eq("image4_string_goes_here.jpg")
    end

    it 'can return users by partial search on username' do
      user1 = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")
      user2 = User.create(username: "rob", email: "rob@turing.com", password: "iloveruby", avatar: "image2_string_goes_here.jpg")
      user3 = User.create(username: "knob", email: "knob@turing.com", password: "iworshipruby", avatar: "image3_string_goes_here.jpg")
      user4 = User.create(username: "jan", email: "jan@turing.com", password: "imabeast", avatar: "image4_string_goes_here.jpg")
      user5 = User.create(username: "kat", email: "kat@turing.com", password: "bestinstructorever", avatar: "image5_string_goes_here.jpg")
      user6 = User.create(username: "abdul", email: "abdul@turing.com", password: "kingofmod2", avatar: "image6_string_goes_here.jpg")
      user7 = User.create(username: "jeff", email: "jeff@turing.com", password: "iownthisshizz", avatar: "image7_string_goes_here.jpg")
      
      get "/api/v1/users/search?query="

      expect(response.status).to eq 200

      users = JSON.parse(response.body, symbolize_names: true)[:data]
require 'pry'; binding.pry
      expect(users.count).to eq(2)

      first = users.first

      expect(first[:type]).to eq("user")
      expect(first[:id]).to eq(user4.id.to_s)
      expect(first[:attributes][:username]).to eq("jan")
      expect(first[:attributes][:email]).to eq("jan@turing.com")
      expect(first[:attributes][:avatar]).to eq("image4_string_goes_here.jpg")
    end
  end
end



  
  #   get "/api/v0/gratitudes/#{@gratitude1.user_id}/dates"

  #   dates = JSON.parse(response.body, symbolize_names: true)[:data]

  #   

  #   dates.each do |date|
  #     expect(date).to have_key(:attributes)
  #     expect(date[:attributes]).to be_a(Hash)

  #     expect(date[:attributes]).to have_key(:user_id)
  #     expect(date[:attributes][:user_id]).to be_a(String)

  #     expect(date[:attributes]).to have_key(:date)
  #     expect(date[:attributes][:date]).to be_a(String)

  #     expect(date[:attributes][:quote]).to have_key(:affirmation)
  #     expect(date[:attributes][:quote]).to be_a(Hash)

  #     expect(date[:attributes]).to have_key(:entry)
  #     expect(date[:attributes][:entry]).to be_a(String)
  #   end

  #   first_date = dates.first

  #   expect(first_date[:attributes][:user_id]).to eq("1")
  #   expect(first_date[:attributes][:date]).to eq("2024-09-11")
  #   expect(first_date[:attributes][:quote][:affirmation]).to be_a(String)
  # end