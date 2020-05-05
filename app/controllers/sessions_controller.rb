class SessionsController < ApplicationController
  def callback
    user = User.find_or_create_with_omniauth!(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
