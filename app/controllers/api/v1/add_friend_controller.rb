class Api::V1::AddFriendController < ApplicationController

  def create
    begin 
      user = User.find_by(id: params[:id])
      friend = User.find_by(id: params[:user_id])
      Friendship.create!(user: user, friend: friend)
      render json: { "data": "You've added a friend!" }, status: 201
    rescue ActiveRecord::RecordInvalid => exception
      render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serialize_json, status: 400
    end
  end

end