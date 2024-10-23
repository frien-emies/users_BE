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
    rescue ActiveRecord::RecordInvalid => exception
      render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serialize_json, status: 400
    end
  end
end