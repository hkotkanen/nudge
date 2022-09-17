class ProfileController < ApplicationController
  def index
    unless session[:user_id]
      redirect_to root_path and return
    else
      @user = User.find(session[:user_id])
    end
    @observations = Observation.joins(:observation_sessions).where(observation_sessions: User.find(@user.id).observation_session_ids)
    #puts(@observations)
    @sessions = ObservationSession.where(user:@user.id)
  end
end
