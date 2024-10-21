require 'rails_helper'

RSpec.describe 'User Login Request', type: :request do
### - HAPPY PATH >:) - ###
  it "successfully creates" do
    user = User.create(username: "bob", email: "bob@turing.com", password: "ihateruby", avatar: "image1_string_goes_here.jpg")

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
end