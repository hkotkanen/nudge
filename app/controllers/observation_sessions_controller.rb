class ObservationSessionsController < ApplicationController
  def show
    @observation_session = ObservationSession.find(params[:id])
  end

  def new
    @now = DateTime.now
    @user = current_user()
    unless ObservationSession.find_by(user:@user, end:nil)
      @observation_session = ObservationSession.create(start:@now, user:@user)
    else
      redirect_to :observations
    end
  end

  def end
    @now = DateTime.now
    @user = User.find(session[:user_id])
    @ongoing_observation_session = ObservationSession.find_by(user:@user, end:nil)
    unless @ongoing_observation_session
      redirect_to :observations
    else
      @ongoing_observation_session.update_attribute(:end, @now)
      redirect_to :observations
    end
  end
end
