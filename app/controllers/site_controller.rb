class SiteController < ApplicationController
  def index
    unless session[:user_id]
      @user = User.create()
      session[:user_id] = @user.id
    else
      @user = User.find(session[:user_id])
    end
    @randEmoji = random_emoji
  end

  def random_emoji
    name = ""
    path = Rails.root.join("app", "assets", "data", "emojis.json")
    e_list = JSON.parse(File.read(path))["emojis"]
    for i in 1..3 do
      name.concat(e_list.sample["html"])
    end
    name.html_safe
  end

end
