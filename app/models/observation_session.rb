class ObservationSession < ApplicationRecord
  belongs_to :user

  has_many :observation_session_observations
  has_many :observations, through: :observation_session_observations
end
