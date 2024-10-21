require 'rails_helper'

RSpec.describe 'User Login Request', type: :request do
### - HAPPY PATH >:) - ###
  it "successfully creates" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "app/assets/images/baby.jpg")

    post "/api/v1/sessions", params: { email: user.email, password: user.password } 

    expect(response.status).to eq(200)

    json = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(json).to have_key(:type)
    expect(json[:type]).to eq("user")

    expect(json).to have_key(:id)
    expect(json[:id]).to be_an(Integer)
    expect(json[:id]).to eq(user.id)

    expect(json[:attributes]).to have_key(:email)
    expect(json[:attributes][:email]).to be_a(String)
    expect(json[:attributes][:email]).to eq(user.email)

    expect(json[:attributes]).to have_key(:username)
    expect(json[:attributes][:username]).to be_a(String)
    expect(json[:attributes][:username]).to eq(user.username)

    expect(json[:attributes]).to have_key(:avatar)
    expect(json[:attributes][:avatar]).to be_a(String)
    expect(json[:attributes][:avatar]).to eq(user.avatar)
  end

### - SAD PATH >:C - ###
  it "renders and error json if there is no email in the database" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "app/assets/images/baby.jpg")

    post "/api/v1/sessions", params: { email: "billybob@farmersonly.com", password: user.password } 

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors]).to be_a(String)
    expect(json[:errors]).to eq("Username or password is incorrect.")
  end

  it "renders an error json if the passwords do not match" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "app/assets/images/baby.jpg")

    post "/api/v1/sessions", params: { email: user.email, password: "ihateruby321" } 

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors]).to be_a(String)
    expect(json[:errors]).to eq("Username or password is incorrect.")
  end

  it "renders an error json if no email is inputted" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "app/assets/images/baby.jpg")

    post "/api/v1/sessions", params: { email: "", password: "iloveruby123" } 

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors]).to be_a(String)
    expect(json[:errors]).to eq("Username or password is incorrect.")
  end

  it "renders an error json if no password is inputted" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "app/assets/images/baby.jpg")

    post "/api/v1/sessions", params: { email: user.email, password: "" } 

    expect(response.status).to eq(400)

    json = JSON.parse(response.body, symbolize_names: true)

    expect(json).to have_key(:errors)
    expect(json[:errors]).to be_a(String)
    expect(json[:errors]).to eq("Username or password is incorrect.")
  end
end