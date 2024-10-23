class Api::V1::UsersController < ApplicationController
  def index
    begin
      user = User.find_by(id: params[:id])
      users = User.all
      users.delete(user)
      if users.length < 1 || user == nil
        render json: { "errors": "There are currently no users in the database." }, status: 400
      else
        render json: UserSerializer.new(users), status: 200
      end
    rescue ActiveRecord::RecordNotFound => exception
      render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serialize_json, status: 400
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