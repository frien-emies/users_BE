class Api::V1::UsersController < ApplicationController
  def index
    users = User.all
    render json: UserSerializer.index_json(users), status: 200
  end
end