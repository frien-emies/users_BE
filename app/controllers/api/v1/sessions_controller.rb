class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      render json: LoginSerializer.login_json(user), status: 200
    else
      render json: { "errors": "Username or password is incorrect." }, status: 400
    end
  end

  def destroy
    id = params[:user_id]
    current_user = User.find_by(id: id)
    if current_user
      render json: LogoutSerializer.logout_json(current_user), status: 200
    else
      render json: { error: 'Error Logging Out or User Not Logged In.' }, status: 401
    end
  end
end