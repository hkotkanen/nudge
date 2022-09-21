class HighScoresController < ApplicationController
  def index
    @scores = Hash.new
    @users = User.all()
    @users.each do |usr|
      @scores[usr.id] = Hash.new
      #session_ids = usr.observation_session_ids
      observations = Observation.joins(:observation_sessions).where(observation_sessions: User.find(usr.id).observation_session_ids)
      if observations.nil? or observations.count == 0
      #if session_ids.count == 0
        @scores[usr.id][:total] = 0
        @scores[usr.id][:score] = 0
        @scores[usr.id][:left] = 0
        @scores[usr.id][:right] = 0
        next
      end
      #observations = Observation.joins(:observation_sessions).where(observation_sessions: session_ids)
      @scores[usr.id][:total] = observations.count
      @scores[usr.id][:left] = observations.where(value: "left").count
      @scores[usr.id][:right] = observations.where(value: "right").count
      @scores[usr.id][:score] = @scores[usr.id][:left].to_f / @scores[usr.id][:total] * 100
    end

    @scores_sorted = @scores.sort_by{|k,v| v[:score]}.reverse
    @scores_sorted = @scores_sorted[0..9]
  end
end
