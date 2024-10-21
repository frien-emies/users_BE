class Api::V1::UsersSearchController < ApplicationController

  def index
    users = User.search(params[:query])
    render json: UserSerializer.new(users)
  end
end