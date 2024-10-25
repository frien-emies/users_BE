class Api::V1::FriendsController < ApplicationController
  def index
    user = User.find_by(id: params[:id])
    if user == nil
      render json: { "errors": "Could not load friends list for this user." }, status: 400
    else
      friends = user.friends_list
      render json: FriendsSerializer.friends_json(friends), status: 200
    end
  end

  def create
    begin 
      user = User.find(params[:id])
      friend = User.find(params[:user_id])
      
      friendship1 = Friendship.create(user: user, friend: friend)
      friendship2 = Friendship.create(user: friend, friend: user)
  
      if friendship1.valid? && friendship2.valid?
        render json: { "data": "You've added a friend!" }, status: 201
      else
        errors = friendship1.errors.full_messages + friendship2.errors.full_messages
        render json: ErrorSerializer.new(ErrorMessage.new(errors.join(", "), 400)).serialize_json, status: 400
      end
    rescue ActiveRecord::RecordNotFound => exception
      render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)).serialize_json, status: 404
    end
  end

  def destroy 
    user = User.find_by(id: params[:id])
    friend = User.find_by(id: params[:user_id])

    if friend && user
      friendship1 = Friendship.find_by(user: user, friend: friend)
      friendship2 = Friendship.find_by(user: friend, friend: user)

      friendship1.delete
      friendship2.delete
      render json: { "data": "You've removed a friend!" }, status: 201
    else
      render json: { "errors": "Could not remove friend." }, status: 400
    end
  end
end