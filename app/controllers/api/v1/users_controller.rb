class Api::V1::UsersController < ApplicationController
  def index
    user = User.find_by(id: params[:id])
    users = User.all
    list = users - [user]

    if user == nil
      render json: { "errors": "You must be logged in or create an account." }, status: 400
    elsif users.length < 1
      render json: { "errors": "There are currently no users in the database." }, status: 400
    else
      render json: UserSerializer.new(list), status: 200
    end
  end

  def show
    user = User.find_by(id: params[:id])
    if user
      render json: UserSerializer.new(user), status: 200
    else
      render json: { "errors": "User not found." }, status: 404
    end
  end
end