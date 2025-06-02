class AuthenticationController < ApplicationController
  include JsonWebToken

  skip_before_action :authenticate_user, only: :login

  def login
    @user = User.find_by_email(params[:email])

    if @user&.authenticate(params[:password])
      token = encode(user_id: @user.id)
      render json: {token: token}, status: :ok
    else
      render json: {error: 'Invalid email or password'}, status: :unauthrized
    end
  end
end
