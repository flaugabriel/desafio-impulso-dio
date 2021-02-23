class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by(name: auth_hash.info.name)
    session[:user_id] = @user.id

    redirect_to root_path
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
