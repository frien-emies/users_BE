class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: LoginSerializer.login_json(user), status: 200
    else
      render json: { "errors": "Username or password is incorrect." }, status: 400
    end
  end
end