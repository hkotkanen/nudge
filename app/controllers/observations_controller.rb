class ObservationsController < ApplicationController
  def index
    @observations = Observation.all()
    @observations_without_humans = @observations.where.missing(:observation_sessions)
    @observations_with_humans = @observations.joins(:observation_sessions).distinct
  end

  skip_before_action :verify_authenticity_token
  def create
    @observation = Observation.create(observation_params)
    @ongoing_sessions = ObservationSession.where(end: nil)
    @ongoing_sessions.each do |session|
      puts("for each session:")
      p(session)
      session.observations.append(@observation)
      session.save
    end
  end

  private
    def observation_params
      params.require(:observation).permit(:start, :end, :value)
    end
end
