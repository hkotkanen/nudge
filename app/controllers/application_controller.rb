class ApplicationController < ActionController::Base
  def current_user
    unless session[:user_id]
      @user = User.create()
      session[:user_id] = @user.id
    else
      @user = User.find(session[:user_id])
    end
  end
end
