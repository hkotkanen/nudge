class SiteController < ApplicationController
  def index
    unless session[:user_id]
      @user = User.create()
      session[:user_id] = @user.id
    else
      @user = User.find(session[:user_id])
    end
  end
end
