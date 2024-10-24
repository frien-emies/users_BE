class Api::V1::AddFriendController < ApplicationController
  # def create
  #   begin 
  #     user = User.find_by(id: params[:id])
  #     friend = User.find_by(id: params[:user_id])
  #     if user && friend
  #       Friendship.create!(user: user, friend: friend)
  #       Friendship.create!(user: friend, friend: user)
  #       render json: { "data": "You've added a friend!" }, status: 201
  #     else
  #       render json: { "errors": "One of more of the users do not exist in the database." }, status: 400
  #     end
  #   rescue ActiveRecord::RecordInvalid => exception
  #     render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serialize_json, status: 400
  #   end
  # end

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
end