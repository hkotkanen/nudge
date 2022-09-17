class HighScoresController < ApplicationController
  def index
    @users = User.all()
    @scores = Hash.new
    for @users.each do |usr|
      observations = Observation.joins(:observation_sessions).where(observation_sessions: User.find(usr.id).observation_session_ids)
      total = observations.count
      left_n = observations.where(value: 'left').count
      right_n = observations.where(value: 'right').count
      puts("#{total} total, left #{left_n}, left #{right_n}")
#      @scores[usr.id] = (left_n/total * 100)
    end
  end
end
