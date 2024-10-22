require 'rails_helper'

RSpec.describe 'User Login Request', type: :request do
### - HAPPY PATH >:) - ###
  it "successfully logs out and returns a json response" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "app/assets/images/baby.jpg")

    post "/api/v1/sessions", params: { email: user.email, password: user.password } 
    delete "/api/v1/sessions", params: { user_id: user.id } 

    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:type)
    expect(json[:type]).to be_a(String)
    expect(json[:type]).to eq("user")

    expect(json).to have_key(:id)
    expect(json[:id]).to be_an(Integer)
    expect(json[:id]).to eq(user.id)

    expect(json).to have_key(:attributes)
    expect(json[:attributes]).to be_a(Hash)
    
    expect(json[:attributes]).to have_key(:message)
    expect(json[:attributes][:message]).to be_a(String)
    expect(json[:attributes][:message]).to eq("User successfully logged out.")
  end

### - SAD PATH >:( - ###
  it "fails to log out and returns a json response" do
    user = User.create!(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "app/assets/images/baby.jpg")
    user2_id = user.id - 1 

    post "/api/v1/sessions", params: { email: user.email, password: user.password } 
    delete "/api/v1/sessions", params: { user_id: user2_id } # send wrong user id

    expect(response.status).to eq(401)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:error)
    expect(json[:error]).to be_a(String)
    expect(json[:error]).to eq("Error Logging Out or User Not Logged In.")
  end
end