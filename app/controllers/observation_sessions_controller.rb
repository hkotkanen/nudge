class ObservationSessionsController < ApplicationController
  def show
    @observation_session = ObservationSession.find(params[:id])
  end

  def start
    @now = DateTime.now
    @user = current_user()
    @ongoing_session = ObservationSession.find_by(user:@user, end:nil)
    unless @ongoing_session
      @observation_session = ObservationSession.create(start:@now, user:@user)
    else
      # There is already a session for this user!?!?
      @ongoing_session.update_attribute(:end, @now)
      redirect_to :observations  # need a toast for "something went wrong"
    end
  end

  def end
    @now = DateTime.now
    @user = User.find(session[:user_id])
    @ongoing_session = ObservationSession.find_by(user:@user, end:nil)
    unless @ongoing_session
      redirect_to :observations  # need a toast for "something went wrong"
    else
      @ongoing_session.update_attribute(:end, @now)
      redirect_to @ongoing_session
    end
  end
end
