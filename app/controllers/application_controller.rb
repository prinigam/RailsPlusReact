class ApplicationController < ActionController::API
  include JsonWebToken

  before_action :authenticate_user

  private

  def authenticate_user
    header = request.headers['token']
    token = header.split(" ").last if header

    decoded_token = decode(token)
    @current_user = User.find(decoded_token[:user_id])
  end
end
