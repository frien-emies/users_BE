class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    if users.length < 1
      render json: { "errors": "There are currently no users in the database." }, status: 400
    else
      render json: UserSerializer.new(users), status: 200
    end
  end
end