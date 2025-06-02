class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: :create

  def create
    user = User.new(user_params)
    if user.save!
      render json: {user: user}, status: :created
    else
      render json: {error: "something went wrong"}, status: 400
    end
  end

  private

  def user_params
    params.permit(:email, :password, :username)
  end
end
