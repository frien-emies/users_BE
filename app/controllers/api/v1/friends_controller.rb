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
end